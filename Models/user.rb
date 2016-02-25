require_relative '../Controllers/controller_game'
require_relative '../Controllers/controller_bet'

class User

  #instance variables
  @@betId
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
    @@betId = 0
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

  def getBetId
    @@betId
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

  def setBetId=(bet)
    @@betId = bet
  end

  def incrementBetId
    @@betId += 1
  end


  #add new game to following games hash
  def insertFollowGame(game_id, game)
    @followingGames[game_id] =  game
  end

  def unfollowGame(game_id)
    @followingGames.delete(game_id)
  end

  #add new bet to openBets hash
  def insertOpenBet(bet_id, bet)
    @openBets[bet_id] = bet
  end

  #remove bet from openBets hash
  def removeOpenBet(bet_id)
    @betsHistory.delete(bet_id)
  end

  #add new bet to historyBets hash
  def insertBetHistory(bet_id, bet)
    @betsHistory[bet_id] = bet
  end

  #remove bet from historyBets hash
  def removeBetHistory(bet_id)
    @betsHistory.delete(bet_id)
  end


end
