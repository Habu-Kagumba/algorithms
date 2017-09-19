require 'benchmark'

# Flatten some arrays
class Array
  # Iterative
  def flatten_array
    return self if empty?
    [].tap do |res|
      each do |a|
        a.is_a?(Array) ? res.concat(a.flatten_array) : res << a
      end
    end
  end
end

# Tail Recursive
def flatten_array_recursive(nested_array, flat = [])
  return nested_array if nested_array.empty?

  head, *tail = nested_array
  if head.is_a? Array
    flatten_array_recursive(tail, flat.concat(flatten_array_recursive(head)))
  else
    flatten_array_recursive(tail, flat.push(head))
  end

  flat
end

# Testing
arrays = [
  [[1], 2, [[3, 4], 5], [[[]]], [[[6]]], 7, 8, []],
  [0, 1, 2, [3, 4, [5, 6, [7, 8], 9], 10, 11], 12, 13, [14]],
  [[1, 2, [3]], 4]
]

# arrays.each do |array|
#   Benchmark.bmbm(100) do |bm|
#     bm.report('ruby') do
#       array.flatten
#     end

#     bm.report('iterative') do
#       array.flatten_array
#     end

#     bm.report('tail recursive') do
#       flatten_array_recursive(array)
#     end
#   end
# end

arrays.each do |array|
  custom_iterative_flatten = array.flatten_array
  custom_recursive_flatten = flatten_array_recursive(array)
  pass_iterative = array.flatten == custom_iterative_flatten
  pass_recursive = array.flatten == custom_recursive_flatten

  puts format('%s :: Recursive flatten: %s', array, pass_recursive)
  puts format('%s :: Iterative flatten: %s', array, pass_iterative)
end
