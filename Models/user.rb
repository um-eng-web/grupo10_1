require_relative '../Controllers/controller_game'
require_relative '../Controllers/controller_bet'

class User

  #instance variables
  @username
  @password
  @name
  @balance
  @logged
  @openBets
  @betsHistory
  @followingGames
  @gamesHistory
  @transactionHistory

  #initialize method
  def initialize
    @username = nil
    @password = nil
    @name = nil
    @balance = nil
    @logged = false
    @openBets = Hash.new
    @openBets.default = ControllerBet
    @betsHistory = Hash.new
    @betsHistory.default = ControllerBet
    @followingGames = Hash.new
    @followingGames.default = ControllerGame
    @gamesHistory = Hash.new
    @gamesHistory.default = ControllerGame
    @transactionHistory = Hash.new
    @transactionHistory.default = "Transaction undefined."
  end

  #accessor's methods (getters)
  def getUsername
    @username
  end

  def getPassword
    @password
  end

  def getName
    @name
  end

  def getBalance
    @balance
  end

  def getLogged
    @logged
  end

  def getOpenBets
    @openBets
  end

  def getBetsHistory
    @betsHistory
  end

  def getFollowingGames
    @followingGames
  end

  def getGamesHistory
    @gamesHistory
  end

  def getTransactionHistory
    @transactionHistory
  end

  #setters
  def setUsername=(user)
    @username = user
  end

  def setPassword=(pass)
    @password = pass
  end

  def setName=(name)
    @name = name
  end

  def setBalance=(bal)
    @balance = bal
  end

  def setLogged=(log)
    @logged = log
  end

  def setOpenBets=(oBets)
    @openBets = oBets
  end

  def setBetsHistory=(bHistory)
    @betsHistory = bHistory
  end

  def setFollowingGames=(fGames)
    @followingGames = fGames
  end

  def setGamesHistory=(gHistory)
    @gamesHistory = gHistory
  end

  def setTransactionHistory=(tHistory)
    @transactionHistory = tHistory
  end


  #add new game to following games hash
  def insertFollowGame(game_id, game)
    @followingGames[game_id] =  game
  end

  def unfollowGame(game_id)
    @followingGames.delete(game_id)
  end

end
