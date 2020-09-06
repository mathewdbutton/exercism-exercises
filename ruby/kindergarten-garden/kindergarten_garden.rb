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

  attr_reader :diagram, :students, :cups_per_row

  def initialize(diagram, students = DEFAULT_STUDENTS, cups_per_row = 2)
    @students = students.map(&DOWNCASE_SYMBOLIZE).sort
    @diagram = diagram
    @cups_per_row = cups_per_row
  end

  def display
    parsed_diagram.each do |student, plants|
      puts "#{student}:"
      Array(plants).each_slice(cups_per_row).to_a.map{ |plants| plants.map {|p|ppp[p]}}.each { |row| puts row.join}
      puts "😔" if Array(plants).empty?
    end;0
  end

  def ppp
    {
      grass: "🥦",
      clover: "🍀",
      radishes: "🥕",
      violets: "🌺",
    }
  end

  def parsed_diagram
    segmented_diagram = diagram.split("\n")
    students.zip(merge_rows([], segmented_diagram)).to_h
  end
                # "VCRRGVRG","RVGCCGCV", []
  def merge_rows(output, rows)
    return output if rows[0].empty?
                    # ["VC" + "RV"]
    students_cups = rows.map { |r| r.slice(0,cups_per_row)}.join
                    # [ :violet, :clove, :radish, :violet]
    mapped_plants = students_cups.chars.map{ |c| PLANTS[c] }
               # merge_rows("RRGVRG","RRGVRG", [] + [:violet,:clove,:radish,:violet])
    merge_rows(output + [mapped_plants], rows.map { |r| r.slice(cups_per_row..)})
  end

  def method_missing(method_name, *args, &block)
    super unless students.include?(method_name)
    student = method_name
    parsed_diagram[student]
  end
end
