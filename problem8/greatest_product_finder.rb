class GreatestProductFinder
  # Find the greatest product of five consecutive digits in the 1000-digit number (see input.txt)

  def number_stream
    File.open("input.txt", "r") do |infile|
      while (line = infile.gets)
        line.each_char { |digit| yield Integer(digit) if digit =~ /\d/ }
      end
    end
  end

  def number_block_stream(block_size)
    block = []
    number_stream do |digit|
      if block.size == block_size
        yield block
        block.shift
      end
      block << digit
    end
  end

  def find_greatest_product
    max_product = 0
    number_block_stream(5) do |block|
      product = block.reduce(:*)
      max_product = product if product > max_product
    end
    max_product
  end

end

product_finder = GreatestProductFinder.new
puts "Greatest product: #{product_finder.find_greatest_product}"