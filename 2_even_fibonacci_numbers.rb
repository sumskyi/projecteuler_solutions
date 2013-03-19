class FibonacciSequence
  def initialize(max_number)
    @max_number = max_number
    @list = [1, 2]
  end

  def current
    @list[-1]
  end

  def last_2_elements
    @list[-2..-1]
  end

  def fibonacci_numbers
    next_fibonacci = ->(numbers) { numbers.inject(:+) }

    while current < @max_number do
      @list << next_fibonacci[last_2_elements]
    end

    @list
  end

  def even_numbers
    fibonacci_numbers.select{|number| number.even?}
  end

  def sum
    even_numbers.inject(:+)
  end
end

if $0 == __FILE__
  require 'minitest/autorun'

  describe FibonacciSequence do
    it 'sum for 1000' do
      FibonacciSequence.new(4_000_000).sum.must_equal 4613732
    end
  end
end
