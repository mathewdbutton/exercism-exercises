require "securerandom"


class Robot

  attr_reader :name

  @name_register = {}

  def initialize
    @name = assign_name
  end

  def self.name_register
    @name_register
  end

  def self.forget

  end

  def reset
    self.class.name_register.delete(String(name))
    @name = assign_name
  end

  private

  def assign_name
    loop do
      new_name = generate_name
      unless self.class.name_register.has_key?(new_name)
        self.class.name_register[new_name] = self
        return new_name
      end
    end
  end

  def generate_name
    ('A'..'Z').to_a.freeze.sample(2).join + Random.rand(999).to_s.rjust(3, '0')
  end


end
