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

  def test_number_stream
    fail("not yet implemented")
  end
end