require "big"

class Series
  def initialize(@value : String)
    @value = @value.strip
  end

  def largest_product(digit : Int32)
    raise ArgumentError.new unless @value.scan(/\D/).empty?
    raise ArgumentError.new if @value.size < digit
    raise ArgumentError.new if digit < 0
    return 1 if digit == 0

    largest = 0
    @value.to_big_i.digits.each_cons(digit) do |series|
      p = series.product(&.to_u64)
      largest = p > largest ? p : largest
    end

    largest

    # @value.each_char.cons(digits).max_of(&.product(&.to_u64))
  end
end
