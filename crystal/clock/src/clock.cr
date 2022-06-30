class Clock
  property hour : Int32
  property minute : Int32

  def initialize(@hour = 0, @minute = 0) 
    clock_check
  end

  def to_s : String
    String.build(5) do |buffer|
      h = hour  .to_s.rjust(2, '0')
      m = minute.to_s.rjust(2, '0')
      buffer << "#{h}:#{m}"
    end
  end

  private def clock_check
    @hour   += @minute // 60
    @hour   %= 24
    @minute %= 60
  end

  def + (c : Clock) : Clock
    h = @hour   += c.hour
    m = @minute += c.minute
    Clock.new(h, m)
  end
  
  def - (c : Clock) : Clock
    h = @hour   -= c.hour
    m = @minute -= c.minute
    Clock.new(h, m)
  end
end

c = Clock.new 10, 10
puts c.hour
puts c.minute

d = Clock.new 2, 2
puts d.hour
puts d.minute

puts typeof(c - Clock.new(1, 3))

puts (c - d).to_s
puts

puts "Clock check"
c = Clock.new 72, 8640

puts "Hour   : #{c.hour}"
puts "Minute : #{c.minute}"
