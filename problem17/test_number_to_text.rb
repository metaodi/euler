require 'minitest/reporters'
require 'minitest/autorun'
require_relative 'number_to_text'

MiniTest::Reporters.use!

class TestNumberToText < MiniTest::Unit::TestCase

  def setup
    @text = NumberToText.new
  end

  def teardown
    # Do nothing
  end

  # Fake test
  def test_construct
    assert_kind_of(NumberToText, @text);
  end

  def test_generate_text()
    assert_equal("one",@text.generate_text(1))
  end
end