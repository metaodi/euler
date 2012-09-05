require_relative 'pythagorean_triplet'

pyth = PythagoreanTriplet.new(1000)
pyth.calculate {}

puts pyth.triplet + ", Product: " + pyth.product.to_s