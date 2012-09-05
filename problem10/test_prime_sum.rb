require 'minitest/reporters'
require 'minitest/autorun'
require_relative 'prime_sum'

MiniTest::Reporters.use!

class TestPrimeSum < MiniTest::Unit::TestCase

  def setup
    @prime_sum = PrimeSum.new
  end

  def teardown
    # Do nothing
  end

  def test_constructor
    assert_kind_of(PrimeSum, @prime_sum)
  end

  def test_prime_sum
    assert_equal(2 + 3 + 5 + 7, @prime_sum.prime_sum(10))
    assert_equal(4, @prime_sum.primes_of_sum.size)
  end

end