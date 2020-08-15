require 'pry'

class Allergies
  ALLERGIES = {
    1 => "eggs",
    2 => "peanuts",
    4 => "shellfish",
    8 => "strawberries",
    16 => "tomatoes",
    32 => "chocolate",
    64 => "pollen",
    128 => "cats"
  }.freeze

  attr_reader :score

  def initialize(allergy_score)
    @score = allergy_score
  end

  def allergic_to?(allergy)
    list.include?(allergy)
  end

  def list
    @list ||= discover_allergies(score)
  end

  private

  def discover_allergies(running_score, allergies=[])
    return allergies.compact if running_score <= 0

    nearest_power = Math.log2(running_score).floor

    discover_allergies(running_score - 2**nearest_power, [*allergies, ALLERGIES[2**nearest_power]])
  end

end
