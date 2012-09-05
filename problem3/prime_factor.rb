require_relative '../prime_number'

class PrimeFactor
  include PrimeNumber

  def factor(number)
    factors = Array.new
    remains = number

    while remains > 1 do
      next_prime do |prime|
        if remains % prime == 0
          factors << prime
          remains = remains / prime
          break
        end
      end
    end
    factors
  end

end
