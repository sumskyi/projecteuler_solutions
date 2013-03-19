class PrimeFactor
  def initialize(number)
    @number = number
    @divizors = []
  end

  def all
    current = 2

    while 2 < @number do
      if factor_of?(current)
        @divizors << current
        @number = @number / current
      else
        current = current + 1
      end
    end

    @divizors
  end

  def max
    all[-1]
  end

  def factor_of?(n)
    0 == @number % n
  end
end

if $0 == __FILE__
  require 'minitest/autorun'

  describe PrimeFactor do
    it 'all for 13195' do
      PrimeFactor.new(13195).all.must_equal [5, 7, 13, 29]
    end

    it 'max for 13195' do
      PrimeFactor.new(13195).max.must_equal 29
    end

    it 'max for 600851475143' do
      PrimeFactor.new(600_851_475_143).max.must_equal 6857
    end
  end
end
