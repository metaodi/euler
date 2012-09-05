require_relative '../prime_number'

class PrimeSum
  attr_reader :primes_of_sum
  include PrimeNumber

  def prime_sum(max)
    @primes_of_sum = []
    next_prime do |prime|
      break if prime >= max
      @primes_of_sum << prime
    end
    @primes_of_sum.reduce(:+)
  end
end