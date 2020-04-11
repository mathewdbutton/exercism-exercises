class Robot
  attr_reader :name

  NAME_SET = ("AA000".."ZZ999").to_a

  @name_register = []

  def initialize
    @name = assign_name
  end

  def self.name_register
    if @name_register.empty?
      @name_register = NAME_SET.dup
    end
    @name_register
  end

  def self.forget
    @name_register = []
  end

  def reset
    name_register << name
    @name = assign_name
  end

  private

  def assign_name
    name_register.delete_at(random_index)
  end

  def name_register
    self.class.name_register
  end

  def random_index
    return 0 if name_register.length - 1 == 0

    Random.rand(name_register.length - 1)
  end
end
