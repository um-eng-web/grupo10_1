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
  def printBetId
    @betId
  end

  def printType
    @type
  end

  def printState
    @state
  end

  def printBetAmount
    @betAmount
  end

  def printResult
    @result
  end

  def printOdd
    @odd
  end


  #setters
  def setBetId(id)
    @betId = id
  end

  def setType(type)
    @type = type
  end

  def setState(state)
    @state = state
  end

  def setResult(result)
    @result = result
  end

  def setOdd(odd)
    @odd = odd
  end


  #toString method
  def to_s
    puts "Bet Id ::  #{@betId}"
    puts "Type :: #{@type}"
    puts "State :: #{@state}"
    puts "Bet Amount :: #{@betAmount}"
    puts "Result :: #{@result}"
    puts "Odd :: #{@odd}"
  end

end