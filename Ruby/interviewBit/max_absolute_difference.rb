def max_abs_diff(a)
  max = 0

  (1..(a.size)).to_a.combination(2).each do |comb|
    i = comb[0]
    j = comb[1]

    res = (a[i - 1] - a[j - 1]).abs + (i - j).abs
    max = res if res > max
  end

  max
end

def faster_max_abs_diff(a)
  n = a.size
  max1 = max2 = min1 = min2 = a[0]
  ans = 0

  (0..(n - 1)).to_a.each do |i|
    max1 = [max1, a[i] + i].max
    max2 = [max2, a[i] - i].max
    min1 = [min1, a[i] + i].min
    min2 = [min2, a[i] - i].min
  end

  ans = [ans, (max2 - min2)].max
  ans = [ans, (max1 - min1)].max

  ans

end

a = [1, 3, -1]
p max_abs_diff(a)
p faster_max_abs_diff(a)
