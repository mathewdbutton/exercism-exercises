module Luhn
  def self.valid?(number)
    LuhnNumber.new().valid?(number)
  end
end

class LuhnNumber
  def valid?(number)
    clean_number = number.delete(" ")

    return false if illegal_number?(clean_number)
    numbers = clean_number.chars.reverse
    summed_number = 0
    numbers.each_with_index do |value, index|
      summed_number += accumulate(index + 1, value.to_i)
    end
    summed_number % 10 == 0

  end

  def illegal_number?(number)
    number.length < 2 || number.match(/[^0-9]/)
  end

  def accumulate(index, value)
    return value if index % 2 != 0

    result = value * 2
    result -= 9 if result >= 10
    result
  end
end
