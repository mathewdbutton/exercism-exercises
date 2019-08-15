module Acronym
  def self.abbreviate(value)
    value.scan(/\b\w/).map(&:upcase).join
  end
end
