ROMAN_NUMBERS = {
  "M"  => 1000, "CM" => 900, "D"  => 500, "CD" => 400, "C"  => 100,
  "XC" => 90,   "L"  => 50,  "XL" => 40,  "X"  => 10,  "IX" => 9,
  "V"  => 5,    "IV" => 4,   "I"  => 1
}

public def to_roman
  number = self
  ROMAN_NUMBERS.map do |letter, value|
    amount, number = number.divmod(value)
    puts " amount: #{amount}, number: #{number}, letter: #{letter}, value: #{value}"
    letter * amount
  end.join
end

module BookKeeping
  VERSION = 2
end
