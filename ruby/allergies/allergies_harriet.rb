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


  def initialize(allergy_score)
    @allergy_score = allergy_score
  end

  def score
    return @allergy_score if @allergy_score <= 255
    allergy_power = Math.log2(@allergy_score).floor
    largest_allergy_upper_bounds = ALLERGIES.size
    @allergy_score - (largest_allergy_upper_bounds..allergy_power).map{ | pow | 2**pow }.sum
  end

  def allergic_to?(allergy)
    list().include?(allergy)
  end

  def list
    crunch.fetch(score,[]).map{ |allergy_index| ALLERGIES[allergy_index] }
  end

  private

  def crunch
    powers = ALLERGIES.keys
    @allergy_indexes ||= (1..ALLERGIES.size).map{ |i| powers.combination(i).to_a }.flatten(1).each_with_object({}) do |comb, obj|
      obj[comb.sum] = comb
    end
  end
end
