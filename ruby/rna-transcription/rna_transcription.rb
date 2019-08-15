class Complement
  def self.of_dna(dna_strand)
    mapper = { "G"=>"C",
               "C"=>"G",
               "T"=>"A",
               "A"=>"U"}


    transcription = dna_strand.split("").map do |c|
      mapper[c]
    end.join("")

    if transcription.length == dna_strand.length
      transcription
    else
      ""
    end

  end

end

module BookKeeping
  VERSION = 4
end
