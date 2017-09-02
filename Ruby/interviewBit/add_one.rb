require 'benchmark'

def plus_one(a)
  return a if a.first.zero? && a.size == 1
  (a.join.to_i + 1).to_s.chars.map(&:to_i)
end

def try_plus_one(a)
  index = a.size - 1
  loop do
    curr = a[index]
    if curr < 9
      a[index] += 1
      break
    else
      a[index] = 0
    end
    index -= 1
  end
  a.shift while a[0] == 0
  a
end

def editorial_plus_one(a)
  index = a.size
  a.unshift(0)
  carry = 1
  loop do
    d = a[index]
    if d < 9
      a[index] += carry
      break
    else
      a[index] = 0
    end
    index -= 1
  end
  a.shift while a[0] == 0
  a
end

def lightweight_plus_one(a)
  remainder = 0
  to_add = 1
  last_index = a.size - 1

  (0..last_index).each do |i|
    out_number = (a[last_index - i] + remainder + to_add)
    digit_in_sum = out_number % 10
    remainder = (out_number / 10)
    a[last_index - i] = digit_in_sum
    to_add = 0
  end

  if remainder > 0
    a << 0
    last_index += 1
    (0..last_index - 1).each do |i|
      a[last_index - i] = a[last_index - i - 1]
    end
    a[0] = remainder
  end

  start_index = 0

  a.each do |x|
    break unless x.zero?
    start_index += 1
  end

  a[start_index..-1]
end

p '/////////////////////////////////'
# p plus_one([0, 1, 9])
# p try_plus_one([0, 1, 9])
# p lightweight_plus_one([0, 1, 9])
p '/////////////////////////////////'

Benchmark.bmbm(100) do |bm|
  bm.report('mine') do
    plus_one([0, 1, 2, 3])
  end

  bm.report('try') do
    try_plus_one([0, 1, 2, 3])
  end

  bm.report('editorial') do
    editorial_plus_one([0, 1, 2, 3])
  end

  bm.report('lightweight') do
    lightweight_plus_one([0, 1, 2, 3])
  end
end
