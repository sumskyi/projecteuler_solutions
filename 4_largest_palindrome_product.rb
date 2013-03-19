class PalindromeProduct
  def initialize(num)
    @start_number = ('9' * (num-1)).to_i + 1
    @end_number = ('9'*num).to_i

    @palindromes = []
  end

  def range
    (@start_number..@end_number).to_a
  end

  def max
    range.each do |n1|
      range.each do |n2|
        res = n1 * n2
        @palindromes << res if palindrome?(res)
      end
    end
    @palindromes.max
  end

  def palindrome?(res)
    res.to_s == res.to_s.reverse
  end
end

if $0 == __FILE__
  require 'minitest/autorun'

  describe PalindromeProduct do
    it 'largest for 2 digits' do
      PalindromeProduct.new(2).max.must_equal 9009
    end

    it 'largest for 3 digits' do
      PalindromeProduct.new(3).max.must_equal 906609
    end
  end
end
