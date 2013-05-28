class Square
  def initialize(first_n)
    @n = first_n
  end

  # 1**2 + 2**2 + ... + 10**2
  def sum_squares
    1.upto(@n).inject(0){|acc, el| acc += el ** 2 }
  end

  # (1 + 2 + ... + 10) ** 2
  def square_sum
    1.upto(@n).inject(0){|acc, el| acc += el } ** 2
  end

  def difference
    square_sum - sum_squares
  end
end

if $0 == __FILE__
  require 'minitest/autorun'

  describe Square do
    it 'sum_squares for 10' do
      Square.new(10).sum_squares.must_equal 385
    end

    it 'quare of the sum for 10' do
      Square.new(10).square_sum.must_equal 3025
    end

    it 'difference for 10' do
      Square.new(10).difference.must_equal 2640
    end

    # the task
    it 'difference for 100' do
      Square.new(100).difference.must_equal 25_164_150
    end

  end
end
