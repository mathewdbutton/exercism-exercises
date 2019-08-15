module Luhn
  def self.valid?(number)
    LuhnNumber.new(number).valid?
  end
end

class LuhnNumber
  attr_reader :number

  def initialize(number)
    @number = clean_number(number)
  end

  def valid?
    return false if illegal_number?(number)
    (check_sum(number.chars) % 10).zero?
  end

  def clean_number(number)
    number.delete(" ").reverse
  end

  def illegal_number?(number)
    number.length < 2 || number.match(/[^0-9]/)
  end

  def check_sum(number_array)
    number_array.each_slice(2).reduce(0) do |acc, val|
      acc + accumulate(val[0].to_i, val[1].to_i)
    end
  end

  def accumulate(first, second)
    result = second * 2
    result -= 9 if result >= 10
    first + result
  end
































































  def diff
    check_sum(number.chars) % 10
   end

  def self.luhnar_calendar(year = 2019)
    (1...330).each do | n |
      date = (Time.new(year) + (60*60*25*n)).strftime("%d%m%Y")
      puts "#{(Time.new(year) + (60*60*25*n)).strftime("%d/%m/%Y")} is valid" if new(date).valid?
    end
  end

  def luhniversity()
    split_numbers = number.chars

    unmodded_numbers = split_numbers.map.with_index do |n, i|
      result = n.to_i
      if (i % 2) == 0
       result = result * 2
      end
      result
    end

    modded_numbers = unmodded_numbers.map.with_index do |n, i|
      result = n.to_i
      if (i % 2) == 0
        result -= 9 if result >= 10
      end
      result
    end

    x = (10 - (modded_numbers.sum % 10))%10

    puts """
    Step 1 - Setup
    #{split_numbers.reverse.join('|')}|x
    Step 2 - Double odd numbers
    #{unmodded_numbers.reverse.join('|')}|x
    Step 3 - Mod 9 odd numbers
    #{modded_numbers.reverse.join("|")}|x
    Step 4 - Sum numbers
    #{modded_numbers.sum}
    Step 5 - Find x
    x = #{modded_numbers.sum} mod 10
    x = #{x}
    """
    puts "#{split_numbers.reverse.join}#{x} is your valid luhn number"
  end
end
