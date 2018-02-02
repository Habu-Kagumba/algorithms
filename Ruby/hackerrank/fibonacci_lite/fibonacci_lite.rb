class Fibonacci
  def self.seq(n)
    n <= 1 ? n : seq(n - 1) + seq(n - 2)
  end
end
