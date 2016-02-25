require_relative '../Models/user'
require_relative '../Views/view_user'

class ControllerUser

  #instance variables
  @userModel
  @userView

  #TODO transaction methods

  def initialize
      @userModel = User.new
      @userView = ViewUser.new
  end

  #accessors
  def getUserModel
    @userModel
  end

  def getUserView
    @userView
  end

  #setters
  def setUserModel=(userM)
    @userModel = userM
  end

  def setUserView=(userV)
    @userView = userV
  end


  #methods
  #CRUD operations
  def createUser
    var = @userView.createUser
    array = var.split(":")
    @userModel.setUsername =array[0]
    @userModel.setPassword = array[1]
    @userModel.setName = array[2]
    @userModel.setBalance = array[3].to_f
  end

  def readUser
    @userView.readUser(@userModel.getUsername, @userModel.getName, @userModel.getBalance, @userModel.getLogged, @userModel.getOpenBets.length, @userModel.getFollowingGames.length)
  end

  def updateUser
    var = @userView.updateUser
    array = var.split(":")
    @userModel.setUsername =array[0]
    @userModel.setPassword = array[1]
    @userModel.setName = array[2]
    @userModel.setBalance = array[3].to_f
  end

  def deleteUser
    @userView.deleteUser(@userModel.getUsername, @userModel.getName, @userModel.getBalance)
  end

  #authenticate method
  def authenticateUser(username, password)
    if (@userModel.getUsername == username && @userModel.getPassword == password && @userModel.getLogged == false)
      @userModel.setLogged = true
    end
  end

  #method to show the following games
  def showFollowingGames
    followed = @userModel.getFollowingGames
    followed.each_value{|value| puts value.readGame}
  end

  def showHistoryGames
    history = @userModel.getGamesHistory
    history.each_value{|value| puts value.readGame}
  end

  #TODO showOpenBets, showBetsHistory
  def showOpenBets
    bets = @userModel.getOpenBets
    bets.each_value{|value| puts value.readBet}
  end


  #follow game method
  def followGame(game_id, game)
    if (@userModel.getFollowingGames.has_key? (game_id)) == false
      @userModel.insertFollowGame(game_id, game)
    end
  end

  #unfollow game method
  def unfollowGame
    showFollowingGames
    index = @userView.selectUnfollowGame.to_i
    @userModel.unfollowGame(index)
  end

  #transaction betCoins method
  def transactionBetCoins(mode)
    amount = @userView.transactionBetCoins.to_f
    balance = @userModel.getBalance.to_f
    if(mode == "deposit")
      @userModel.setBalance = balance + amount
    elsif(mode == "withdrawal")
      @userModel.setBalance = balance - amount
    end
    return @userModel.getBalance
  end

  #change password method
  def changePassword
    passwords = @userView.changePassword
    if (passwords[0] == @userModel.getPassword && passwords[1] == passwords[2])
      @userModel.setPassword = passwords[1]
    else
      @userView.throwNewPasswordException
    end
  end

  #bet method
  def bet(idGame, game)
    bet = ControllerBet.new
    bet.createBet(@userModel.getBetId, idGame, game)
    @userModel.insertOpenBet(@userModel.getBetId, bet)
  end



end
