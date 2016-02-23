class Odd

  #instance variables
  @bookieName
  @odd1
  @oddX
  @odd2
  @timestamp


  #initialize
  def initialize
    @bookieName = nil
    @odd1 = nil
    @oddX = nil
    @odd2 = nil
    @timestamp = nil
  end

  #accessors
  def getBookieName
    @bookieName
  end

  def getOdd1
    @odd1
  end

  def getOddX
    @oddX
  end

  def getOdd2
    @odd2
  end

  def getTimestamp
    @timestamp
  end


  #setters
  def setBookieName=(name)
    @bookieName = name
  end

  def setOdd1=(one)
    @odd1 = one
  end

  def setOddX=(x)
    @oddX = x
  end

  def setOdd2=(two)
    @odd2 = two
  end

  def setTimestamp=(time)
    @timestamp = time
  end


end
