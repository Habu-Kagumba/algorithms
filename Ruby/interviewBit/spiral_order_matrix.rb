def spiral_order(a)
  t, b, l, r, d = 0, a.size - 1, 0, a.first.size - 1, 0
  result = []
  while t <= b && l <= r
    if d == 0
      (l..r).each do |i|
        result << a[t][i]
      end
      t += 1
      d = 1
    elsif d == 1
      (t..b).each do |i|
        result << a[i][r]
      end
      r -= 1
      d = 2
    elsif d == 2
      (l..r).to_a.reverse.each do |i|
        result << a[b][i]
      end
      b -= 1
      d = 3
    elsif d == 3
      (t..b).to_a.reverse.each do |i|
        result << a[i][l]
      end
      l += 1
      d = 0
    end
  end

  result
end

a = [[1,2,3], [4,5,6], [7,8,9]]
p spiral_order(a)
