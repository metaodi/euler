require_relative 'prime_sum'

max = 2000000
prime_sum = PrimeSum.new
puts "Sum for primes below #{max}: #{prime_sum.prime_sum(max)}"