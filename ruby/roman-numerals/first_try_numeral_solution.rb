class Integer
  MAP = {1=>'I', 5=>'V', 10=>'X' ,50=>'L', 100=>'C', 500=>'D', 1000=>'M'}
  def to_roman
    result = ''
    split_number = self.to_s.split('')
    split_number.each_with_index do |value, index|
      reverse_index = split_number.length-1 - index
      result += find_correct_numeral(value.to_i * (10**reverse_index))
    end
    result
  end

  # My attempt at implmenting this without converting it to a string
  # Not ideal
  def to_roman_1
    result = ''
    iterations = Math.log(self,10).to_i + 1
    iterations.times do |value|
      result = find_correct_numeral(((self % 10**(value+1))/(10**value)) * (10**value)) + result
    end
    result
  end

  private
  def subtracted_numeral(value, offset)
    subtract_one = MAP[value + offset]
    if subtract_one != nil
      return "#{MAP[offset]}#{subtract_one}"
    else
      return ''
    end
  end

  def find_correct_numeral(number)
    result = case number
    when (0..10)
      subtracted_numeral(number,1)
    when (11..100)
      subtracted_numeral(number,10)
    when number > 100
      subtracted_numeral(number,100)
    else
      ''
    end

    if result.empty?
      remaining_number = number
      while(remaining_number > 0) do
        greater_than = MAP.keys.reverse.find{ |k| k <= remaining_number}
        remaining_number -= greater_than
        result += MAP[greater_than]
      end
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
