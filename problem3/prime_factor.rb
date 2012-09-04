class PrimeFactor
  def next_prime(number_of_primes=nil)
    number = 2
    while (number_of_primes.nil? or number_of_primes > 0)
      if is_prime?(number)
        number_of_primes -= 1 unless number_of_primes.nil?
        yield number
      end
      number += 1
    end
  end

  def is_prime?(number)
    (number - 1).downto(2) do |i|
      if number % i == 0
        return false
      end
    end
    return true
  end

  def factor(number)
    factors = Array.new
    remains = number

    while (remains > 1) do
      next_prime do |prime|
        if (remains % prime == 0)
          factors << prime
          remains = remains / prime
          break
        end
      end
    end
    factors
  end

end

prime = PrimeFactor.new
puts prime.factor(600851475143)
