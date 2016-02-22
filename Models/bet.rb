class Bet

  #instance variables
  @betId
  @type
  @state
  @betAmount
  @result
  @odd

  #initialize
  def initialize(id, type, state, amount, result, odd)
    @betId = id
    @type = type
    @state = state
    @betAmount = amount
    @result = result
    @odd = odd
  end


  #accessors
  def getBetId
    @betId
  end

  def getType
    @type
  end

  def getState
    @state
  end

  def getBetAmount
    @betAmount
  end

  def getResult
    @result
  end

  def getOdd
    @odd
  end


  #setters
  def setBetId=(id)
    @betId = id
  end

  def setType=(type)
    @type = type
  end

  def setState=(state)
    @state = state
  end

  def setResult=(result)
    @result = result
  end

  def setOdd=(odd)
    @odd = odd
  end

end