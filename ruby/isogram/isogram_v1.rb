class Isogram

  def self.isogram?(input)
    alpha_check = []
    result = true
    input.downcase.each_char do | letter |
      next if [" ","-"].include?(letter)
      result = false if alpha_check.include?(letter)
      alpha_check << letter
    end
    return result
  end
end
