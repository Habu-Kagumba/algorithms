# encoding: UTF-8

def max_sub_array(a)
  max_so_far = max_here = a[0]
  a[1..-1].each do |x|
    max_here = [x, (max_here + x)].max
    max_so_far = [max_here, max_so_far].max
  end
  max_so_far
end

p maxSubArray(a)
