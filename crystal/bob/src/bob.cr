class Bob
  def self.hey(he_got : String)
    return "Fine. Be that way!" if he_got.blank?

    case {question?(he_got), scream?(he_got)}
    in {true, false}
      return "Sure."
    in {false, true}
      return "Whoa, chill out!"
    in {true, true}
      return "Calm down, I know what I'm doing!"
    in {false, false}
      return "Whatever."
    end
  end

  def self.question?(your_words : String) : Bool your_words.ends_with?("?") end

  def self.scream?(your_words : String) : Bool
    alphabet = your_words.scan(/[a-zA-Z']+/)
    return false if alphabet.size < 1

    alphabet.map do |str|
      str[0].each_char do |c|
        return false if c >= 'a' && c <= 'z'
      end
    end

    true
  end
end
