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
    segmented_diagram = diagram. #VCRRGVRG\nRVGCCGCV
                        split("\n"). # ["VCRRGVRG", "RVGCCGCV"]
                        map { |a|
                          a. # "VCRRGVRG"
                          chars. # ["V", "C", "R", "R", "G", "V", "R", "G"]
                          each_slice(2).
                          map(&:join) # ["VC", "RR", "GV", "RG"]
                         } # [["VC", "RR", "GV", "RG"], ["RV", "GC", "CG", "CV"]]

    @parsed_diagram ||= students.zip(
      segmented_diagram[0].zip(segmented_diagram[1] # [["VC", "RV"], ["RR", "GC"], ["GV", "CG"], ["RG", "CV"]]
      ).map(&:join) # ["VCRV", "RRGC", "GVCG", "RGCV"]
    ) # [[:alice, "VCRV"], [:bob, "RRGC"], [:charlie, "GVCG"], [:david, "RGCV"], [:eve, nil], [:fred, nil], [:ginny, nil], [:harriet, nil], [:ileana, nil], [:joseph, nil], [:kincaid, nil], [:larry, nil]]
      .to_h # {:alice=>"VCRV", :bob=>"RRGC", :charlie=>"GVCG", :david=>"RGCV", :eve=>nil, :fred=>nil, :ginny=>nil, :harriet=>nil, :ileana=>nil, :joseph=>nil, :kincaid=>nil, :larry=>nil}
  end


  def method_missing(method_name, *args, &block)
    super unless students.include?(method_name)
    student = method_name
    parsed_diagram[student].chars.map { |c| PLANTS[c]}
  end
end
