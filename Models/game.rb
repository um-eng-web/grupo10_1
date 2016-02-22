class Game

  #instance variables
  @gameId
  @team1
  @team2
  @result
  @odds
  @gameCreator

  #initialize
  def initialize(id, t1, t2, res, odd, creator)
    @gameId = id
    @team1 = t1
    @team2 = t2
    @result = res
    @odds = odd
    @gameCreator = creator
  end

  #accessor methods
  def getGameId
    @gameId
  end

  def getTeam1
    @team1
  end

  def getTeam2
    @team2
  end

  def getResult
    @result
  end

  def getOdds
    @odds
  end

  def getGameCreator
    @gameCreator
  end


  #setter's
  def setGameId=(gId)
    @gameId = gId
  end

  def setTeam1=(t1)
    @team1 = t1
  end

  def setTeam2=(t2)
    @team2
  end

  def setResult=(res)
    @result = res
  end

  def setOdds=(odds)
    @odds = odds
  end

  def setGameCreator=(gc)
    @gameCreator = gc
  end

end