class NumberToText
  @ones = { 1 => "one" }
  def generate_text(number)
    @ones[number]
  end
end