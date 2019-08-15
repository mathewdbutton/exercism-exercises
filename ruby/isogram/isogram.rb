require 'set'
class Isogram
  IGNORED_CHARS = ["-"," "].freeze

  attr_reader :value

  def self.isogram?(input)
    new(input).valid?
  end

  def initialize(input)
    @value = input.to_s
  end

  def valid?
    unique_chars.length == filtered_value.length
  end

  private
  def filtered_value
    value.downcase.delete(IGNORED_CHARS.join)
  end

  def unique_chars
    Set.new(filtered_value.each_char.to_a)
  end
end
