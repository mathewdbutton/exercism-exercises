class Robot
  attr_reader :name

  NAME_SET = ("AA000".."ZZ999").to_a

  @name_register = []

  def initialize
    @name = assign_name
  end

  def self.name_register
    @name_register
  end

  def self.forget
    @name_register = NAME_SET.dup
  end

  def reset
    name_register.prepend(name)
    @name = assign_name
  end

  private

  def assign_name
    name_register.pop
  end

  def name_register
    self.class.name_register
  end
end
