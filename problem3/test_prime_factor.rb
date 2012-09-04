require 'minitest/reporters'
require 'minitest/autorun'
require_relative 'prime_factor'

MiniTest::Reporters.use!

class TestPrimeFactor < MiniTest::Unit::TestCase

  def setup
    @prime = PrimeFactor.new
  end

  def teardown
    # Do nothing
  end

  def test_constructor
    assert_kind_of(PrimeFactor, @prime)
  end

  def test_next_prime_one
    @prime.next_prime(1) {|number| assert_equal(1,number)}
  end

  def test_next_prime_one
    @prime.next_prime(0) {|number| fail("Should not get in block")}
  end

  def test_next_prime_ten
    result = ""
    @prime.next_prime(10) {|number| result += "#{number},"}
    assert_equal("2,3,5,7,11,13,17,19,23,29,",result)
  end

  def test_next_prime_undefined
    result = ""
    @prime.next_prime do |number|
      break if number > 10
      result += "#{number},"
    end
    assert_equal("2,3,5,7,",result)
  end

  def test_factor_small
    assert_equal([3,5,5], @prime.factor(75))
  end

  def test_factor_medium
    assert_equal([3,5,17,29], @prime.factor(7395))
  end
end