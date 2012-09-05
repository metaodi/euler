require 'minitest/reporters'
require 'minitest/autorun'
require_relative 'greatest_product_finder'

MiniTest::Reporters.use!

class TestGreatestProductFinder < MiniTest::Unit::TestCase

  def setup
    @finder = GreatestProductFinder.new
  end

  def teardown
    # Do nothing
  end

  def test_constructor
    assert_kind_of(GreatestProductFinder, @finder)
  end

  def test_number_stream_first
    result = []
    @finder.number_stream do |digit|
      result << digit
      break if result.size == 5
    end
    assert_equal([7,3,1,6,7], result)
  end

  def test_number_stream_size
    result = []
    @finder.number_stream { |digit| result << digit }
    assert_equal(1000, result.size)
  end

  def test_number_block_stream
    @finder.number_block_stream(2) do  |block|
      assert_equal(2,block.size)
      assert_kind_of(Integer,block[0])
      assert_kind_of(Integer,block[1])
    end
  end

  def test_find_greatest_product
    product = @finder.find_greatest_product
    refute_equal(0,product)
    assert_kind_of(Integer,product)
  end
end