require 'minitest/reporters'
require 'minitest/autorun'
require_relative 'pythagorean_triplet'

MiniTest::Reporters.use!

class TestPythagoreanTriplet < MiniTest::Unit::TestCase

  def setup
    @pyth = PythagoreanTriplet.new(1000)
  end

  def teardown
  end

  def test_constructor
    assert_kind_of(PythagoreanTriplet, @pyth)
  end

  def test_diff_doubles_four
    results = []
    @pyth.diff_doubles(4) do |a,b|
      results << [a,b]
    end
    assert_equal(2,results.size)
    assert_equal([0,4], results.at(0))
    assert_equal([1,3], results.at(1))
  end

  def test_diff_doubles_five
    results = []
    @pyth.diff_doubles(5) do |a,b|
      results << [a,b]
    end
    assert_equal(3,results.size)
    assert_equal([0,5], results.at(0))
    assert_equal([1,4], results.at(1))
    assert_equal([2,3], results.at(2))
  end

  def test_diff_doubles_twenty
    results = []
    @pyth.diff_doubles(20) do |a,b|
      results << [a,b]
    end
    assert_equal(10,results.size)
    assert_equal([0,20], results.at(0))
    assert_equal([1,19], results.at(1))
    assert_equal([2,18], results.at(2))
    assert_equal([3,17], results.at(3))
    assert_equal([4,16], results.at(4))
    assert_equal([5,15], results.at(5))
    assert_equal([6,14], results.at(6))
    assert_equal([7,13], results.at(7))
    assert_equal([8,12], results.at(8))
    assert_equal([9,11], results.at(9))
  end

  def test_calculate
    refute_nil(@pyth.calculate {})

    puts @pyth.triplet + ", Product: " + @pyth.product.to_s

    #sum
    assert_equal(@pyth.max, @pyth.a + @pyth.b + @pyth.c)

    #pythagoras
    assert_equal(@pyth.c, Math.sqrt(@pyth.a ** 2 + @pyth.b ** 2))

    # sequence
    assert(@pyth.a < @pyth.b)
    assert(@pyth.b < @pyth.c)
    assert(@pyth.a < @pyth.c)
  end

  def test_pythagoras_true
    @pyth.instance_variable_set("@a", 3.0)
    @pyth.instance_variable_set("@b", 4.0)
    @pyth.instance_variable_set("@c", 5.0)
    # 9 + 16 = 25
    assert(@pyth.pythagoras?)
  end

  def test_pythagoras_false
    @pyth.instance_variable_set("@a", 1.0)
    @pyth.instance_variable_set("@b", 2.0)
    @pyth.instance_variable_set("@c", 3.0)
    # 1 + 4 != 9
    refute(@pyth.pythagoras?)
  end

  def test_simple_case
    simple_pyth = PythagoreanTriplet.new(12)
    assert_equal([3,4,5], simple_pyth.calculate {})

    #sum
    assert_equal(simple_pyth.max, simple_pyth.a + simple_pyth.b + simple_pyth.c)

    #pythagoras
    assert_equal(simple_pyth.c, Math.sqrt(simple_pyth.a ** 2 + simple_pyth.b ** 2))

    # sequence
    assert(simple_pyth.a < simple_pyth.b)
    assert(simple_pyth.b < simple_pyth.c)
    assert(simple_pyth.a < simple_pyth.c)
  end

end