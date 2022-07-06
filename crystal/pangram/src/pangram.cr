class Pangram
  def self.pangram?(s : String) : Bool
    s.downcase.chars.select(&.ascii_letter?).tally.size == 26
    # ('a'..'z').all?{|c| s.downcase.includes?(c)}
  end
end
