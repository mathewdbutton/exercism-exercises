class Hamming
  def self.compute(string1,string2)
    count = 0
    raise ArgumentError if string1.length != string2.length

    string1.split("").find_all do |char|
      char != string2.slice!(0)
    end.count

  end
end

module BookKeeping
   VERSION = 3 # Where the version number matches the one in the test.
end
