class Integer
  NUMERAL_MAP = {1000=>"M", 900=>"CM", 500=>"D", 400=>"CD", 100=>"C", 90=>"XC", 50=>"L", 40=>"XL", 10=>"X", 9=>"IX", 5=>"V", 4=>"IV", 1=>"I"}
  def to_roman
    result = ''
    split_number = self.to_s.split('')
    split_number.each_with_index do |value, index|
      reverse_index = split_number.length-1 - index
      result += find_correct_numerals(value.to_i * (10**reverse_index))
    end
    result
  end

  private
  def find_correct_numerals(number)
    result = ''
    remaining_number = number
    while remaining_number > 0 do
      greater_than = NUMERAL_MAP.keys.find{ |k| k <= remaining_number}
      remaining_number -= greater_than
      result += NUMERAL_MAP[greater_than]
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
