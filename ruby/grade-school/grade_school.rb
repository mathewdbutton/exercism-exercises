class School
  def initialize()
    @grade_list = Hash.new {|hsh, key| hsh[key] = [] }
  end

  def students(grade)
    @grade_list[grade]
  end

  # I feel like add should have to work harder as one would probably
  # use student and students_by_grade far more often than add
  def add(name, grade)
    @grade_list[grade].push(name).sort!
    sorted_keys = @grade_list.sort.to_h
    @grade_list.clear.merge!(sorted_keys)
  end

  def students_by_grade
    @grade_list.keys.map {|key| { grade: key, students: @grade_list[key] }}
  end
end

module BookKeeping

  VERSION = 3

end
