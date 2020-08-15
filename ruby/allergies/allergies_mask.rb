require 'pry'

class Allergies
  ALLERGIES = {
    "eggs" => 1,         # "00000001"
    "peanuts" => 2,      # "00000010"
    "shellfish" => 4,    # "00000100"
    "strawberries" => 8, # "00001000"
    "tomatoes" => 16,    # "00010000"
    "chocolate" => 32,   # "00100000"
    "pollen" => 64,      # "01000000"
    "cats" => 128        # "10000000"
  }.freeze

  attr_reader :score

  def initialize(allergy_score)
    @score = allergy_score
  end

  def allergic_to?(allergy)
    (ALLERGIES[allergy] & score).positive?
  end

  def list
    ALLERGIES.keys.select{ |allergy| allergic_to?(allergy) }
  end
end
