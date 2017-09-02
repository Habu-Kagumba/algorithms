require 'benchmark'

def editorial_cover_points(a, b)
  total_steps = 0

  (0..(a.size - 1)).each do |i|
    if (i + 1) < a.size
      total_steps += [(a[i] - a[i + 1]).abs, (b[i] - b[i + 1]).abs].max
    end
  end

  total_steps
end

def lightweight_cover_points(a, b)
  x = a[0]
  y = b[0]
  total_steps = 0
  nxt_idx = 0
  len = a.size

  while nxt_idx < len
    if (x == a[nxt_idx]) && (y == b[nxt_idx])
      nxt_idx += 1
    elsif ((x - a[nxt_idx]).abs >= 1) && ((y - b[nxt_idx]).abs >= 1)
      minimum = [(x - a[nxt_idx]).abs, (y - b[nxt_idx]).abs].min
      a[nxt_idx] - x < 0 ? (x -= minimum) : (x += minimum)
      b[nxt_idx] - y < 0 ? (y -= minimum) : (y += minimum)
      total_steps += minimum
    elsif (x - a[nxt_idx]).abs >= 1
      minimum = (x - a[nxt_idx]).abs
      a[nxt_idx] - x < 0 ? (x -= minimum) : (x += minimum)
      total_steps += minimum
    elsif (y - b[nxt_idx]).abs >= 1
      minimum = (y - b[nxt_idx]).abs
      b[nxt_idx] - y < 0 ? (y -= minimum) : (y += minimum)
      total_steps += minimum
    end
  end

  total_steps
end

Benchmark.bmbm(100) do |bm|
  bm.report('editorial') do
    editorial_cover_points([-7, -13], [1, -5])
  end

  bm.report('lightweight') do
    lightweight_cover_points([-7, -13], [1, -5])
  end
end
