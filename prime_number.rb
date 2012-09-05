module PrimeNumber
  attr_reader :primes

  def initialize
    @primes = []
  end

  def next_prime(number_of_primes=nil)
    number = 2
    while number_of_primes.nil? or number_of_primes > 0
      if is_prime?(number)
        number_of_primes -= 1 unless number_of_primes.nil?
        @primes << number
        yield number
      end
      number += 1
    end
  end

  def is_prime?(number)
    @primes.each do |prime|
      if number  % prime == 0
        return false
      end
    end
    return true
  end
end