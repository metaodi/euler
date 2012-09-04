class PythagoreanTriplet
  attr_reader :a, :b, :c, :max

  def initialize(max)
    @max = max
    @a = 1
    @b = 2
    @c = @max - @a - @b
  end

  def pythagoras?
    Math.sqrt((@a ** 2) + (@b ** 2)) == @c
  end

  def sum
    a + b + c
  end

  def triplet
    "#{a}, #{b}, #{c}"
  end

  def conditions_fulfilled?
    pythagoras? and sum == @max and @a < @b and @b < @c and @a < @c
  end

  def calculate
    @c.downto(0) do | new_c |
      break if conditions_fulfilled?

      @c = new_c
      diff_doubles(@max - @c) do |new_a, new_b|
        @a, @b = new_a, new_b
        yield(triplet)
        break if conditions_fulfilled?
      end
    end
    conditions_fulfilled? ? [@a, @b, @c] : nil
  end

  def diff_doubles(number)
    smaller_part = 0
    number.downto(number/2+1) do | bigger_part |
      yield(smaller_part,bigger_part)
      smaller_part += 1
    end
  end

  def product
    @a * @b * @c
  end

end