class Odd

  #instance variables
  @bookiename
  @odd1
  @oddX
  @odd2
  @timestamp


  #initialize
  def initialize(name, one, x, two)
    @bookiename = name
    @odd1 = one
    @oddX = x
    @odd2 = two
    @timestamp = Time.new
  end

  #accessors
  def printBookiename
    @bookiename
  end

  def printOdd1
    @odd1
  end

  def printOddX
    @oddX
  end

  def printOdd2
    @odd2
  end

  def printTimestamp
    @timestamp
  end


  #setters
  def setBookiename(name)
    @bookiename = name
  end

  def setOdd1(one)
    @odd1 = one
  end

  def setOddX(x)
    @oddX = x
  end

  def setOdd2(two)
    @odd2 = two
  end

  def setTimestamp(time)
    @timestamp = time
  end


  #toString method
  def to_s
    puts "Bookiename ::  #{@bookiename}"
    puts "Odd1 :: #{@odd1}"
    puts "OddX :: #{@oddX}"
    puts "Odd2 :: #{@odd2}"
    puts "Timestamp :: #{@timestamp}"
  end


end
