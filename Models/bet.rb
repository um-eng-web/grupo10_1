class Bet

  #instance variables
  @betId
  @gameId
  @game
  @type #1-x-2
  @state #open-closed-finished
  @betAmount
  @result #1-x-2
  @odd  #just the value of the bet type

  def initialize
    @betId = nil
    @gameId = nil
    @game = nil
    @type = nil
    @state = nil
    @betAmount = nil
    @result = "Undefined"
    @odd = nil
  end


  #accessors
  def getBetId
    @betId
  end

  def getGameId
    @gameId
  end

  def getGame
    @game
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

  def setGameId=(id)
    @gameId = id
  end

  def setGame=(game)
    @game = game
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

  def setBetAmount=(amount)
    @betAmount = amount
  end

end