class Numeric
  def prime?
    return false if self < 2
    2 == (1..self).to_a.select{|n| 0 == self % n}.size
  end
end

class Multiple
  def initialize(max_number)
    @max_number = max_number
  end

  def numbers
    @_numbers ||= (1..@max_number).to_a
  end

  def prime_numbers
    @_prime_numbers ||= numbers.select{|number| number.prime? }
  end

  def current
    @_current ||= prime_numbers.inject(:*)
  end

  def min
    while true
      break current if all_divided?

      @_current += 1
    end
  end

  def all_divided?
    numbers.all?{|el| 0 == current % el}
  end

end

if $0 == __FILE__
  require 'minitest/autorun'

  describe Multiple do
    it 'smallest for 10' do
      Multiple.new(10).min.must_equal 2520
    end

    # 6 seconds
    it 'smallest for 18' do
      Multiple.new(18).min.must_equal 12_252_240
    end

    # 120 seconds
    it 'smallest for 19' do
      Multiple.new(19).min.must_equal 232_792_560
    end

    # 216 seconds
    it 'smallest for 20' do
      Multiple.new(20).min.must_equal 232792560
    end
  end
end
