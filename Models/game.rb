require_relative '../Controllers/controller_odd'

class Game
  #instance variables
  @gameId
  @gameCreator
  @team1
  @team2
  @result
  @odds
  @gameTime #inicio do jogo
  @finished #boolean para dizer se ja acabou
  @closedToBet  #boolean para dizer se esta aberto ou fechado para apostar


  #TODO ajustar o tamanho do array
  def initialize
    @gameId = nil
    @gameCreator = nil
    @team1 = nil
    @team2 = nil
    @result = "Undefined"
    @odds = Array.new
    @gameTime = nil
    @finished = false
    @closedToBet = false
  end

  #accessor methods
  def getGameId
    @gameId
  end

  def getGameCreator
    @gameCreator
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

  def getGameTime
    @gameTime
  end

  def getFinished
    @finished
  end

  def getClosedToBet
    @closedToBet
  end



  #setter's
  def setGameId=(gId)
    @gameId = gId
  end

  def setGameCreator=(gc)
    @gameCreator = gc
  end

  def setTeam1=(t1)
    @team1 = t1
  end

  def setTeam2=(t2)
    @team2 = t2
  end

  def setResult=(res)
    @result = res
  end

  def setOdds=(odds)
    @odds = odds
  end

  def setGameTime=(time)
    @gameTime = time
  end

  def setFinished=(fin)
    @finished = fin
  end

  def setClosedToBet=(closed)
    @closedToBet = closed
  end


  #add new odd method
  def insertOdd(newOdd)
    @odds << newOdd
  end

  #remove odd method
  def removeOdd(index)
    @odds.delete_at(index)
  end

  #get the most recent odd
  def actualOdd
    return @odds.last
  end


end
