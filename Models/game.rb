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
  def printGameId
    @gameId
  end

  def printTeam1
    @team1
  end

  def printTeam2
    @team2
  end

  def printResult
    @result
  end

  def printOdds
    @odds
  end

  def printGameCreator
    @gameCreator
  end


  #setter's
  def setGameId(gId)
    @gameId = gId
  end

  def setTeam1(t1)
    @team1 = t1
  end

  def setTeam2(t2)
    @team2
  end

  def setResult(res)
    @result = res
  end

  def setOdds(odds)
    @odds = odds
  end

  def setGameCreator(gc)
    @gameCreator = gc
  end

  #toString method
  def to_s
    puts "Game Id ::  #{@gameId}"
    puts "Team1 :: #{@team1}"
    puts "Team2 :: #{@team2}"
    puts "Result :: #{@result}"
    puts "Odds :: #{@odds}"
    puts "Game Creator :: #{@gameCreator}"

  end

end