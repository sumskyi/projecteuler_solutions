class Multiplier
  def initialize(below)
    @below = below
  end

  def numbers
    (1...@below).select{|number| 0 == number % 3 or 0 == number % 5}
  end

  def sum
    numbers.inject(:+)
  end
end

if $0 == __FILE__
  require 'minitest/autorun'

  describe Multiplier do
    it 'sum for 10' do
      Multiplier.new(10).sum.must_equal 23
    end

    it 'sum for 1000' do
      Multiplier.new(1_000).sum.must_equal 233168
    end
  end
end
