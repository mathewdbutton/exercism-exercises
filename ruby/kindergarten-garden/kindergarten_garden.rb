class Garden
  DEFAULT_STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry].freeze
  PLANTS = {
    "G" => :grass,
    "C" => :clover,
    "R" => :radishes,
    "V" => :violets
  }

  # Just wanted to try function composition
  DOWNCASE_SYMBOLIZE = :to_sym.to_proc << :downcase.to_proc

  attr_reader :diagram, :students

  def initialize(diagram, students = DEFAULT_STUDENTS)
    @students = students.map(&DOWNCASE_SYMBOLIZE).sort
    @diagram = diagram
  end

  private

  def parsed_diagram
    segmented_diagram = diagram.split("\n")
    students.zip(merge_rows(segmented_diagram[0], segmented_diagram[1])).to_h
  end

                # "VCRRGVRG","RVGCCGCV", []
  def merge_rows(first_row, second_row, output=[])
    return output if first_row.empty?
                    # ["VC" + "RV"]
    students_cups = [first_row.slice(..1) + second_row.slice(..1)]
               # merge_rows("RRGVRG","RRGVRG", [] + ["VCRV"])
    merge_rows(first_row.slice(2..), second_row.slice(2..), output + students_cups)
  end


  def method_missing(method_name, *args, &block)
    super unless students.include?(method_name)
    student = method_name
    parsed_diagram[student].chars.map { |c| PLANTS[c] }
  end
end
