class Raindrops
  RAIN_TRANSLATOR = {3=>'Pling',
                     5=>'Plang',
                     7=>'Plong'}
  def self.convert(number)
    rain_output = ''
    RAIN_TRANSLATOR.each do |key,value|
        rain_output += value if number % key == 0
    end
    rain_output.empty? ? number.to_s : rain_output
  end
end

module BookKeeping
  VERSION = 3
end
