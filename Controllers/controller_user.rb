require_relative '../Models/user'
require_relative '../Views/view_user'
require_relative '../Controllers/controller_notification'
require_relative '../observer'

class ControllerUser < Observer

  @@notificationId
  @userModel
  @userView


  def initialize
    @@notificationId = 1
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
    @userModel.setName = array[1]
  end

  def deleteUser
    @userView.deleteUser(@userModel.getUsername, @userModel.getName, @userModel.getBalance)
  end

  #authenticate method
  def authenticateUser(username, password)
    if (@userModel.getUsername == username && @userModel.getPassword == password && @userModel.getLogged == false)
      @userModel.setLogged = true
      return true
    else
      return false
    end
  end

  #method to show the following games
  def showFollowingGames
    followed = @userModel.getFollowingGames
    followed.each_value{|value|
      if(value.getFinished != true)
        puts value.readGame
      end
    }
  end

  def showHistoryGames
    history = @userModel.getGamesHistory
    history.each_value{|value|
      if(value.getFinished == true)
        puts value.readGame
      end
    }
  end

  def showOpenBets
    bets = @userModel.getOpenBets
    bets.each_value{|value|
      if(value.getState != "Finished")
      puts value.readBet
      end
    }
  end

  def showBetsHistory
    bets = @userModel.getBetsHistory
    bets.each_value{|value|
      if(value.getState == "Finished")
      puts value.readBet
      end
    }
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
  def changePasswordUser
    passwords = @userView.changePassword
    if (passwords[0] == @userModel.getPassword && passwords[1] == passwords[2])
      @userModel.setPassword = passwords[1]
    else
      @userView.throwNewPasswordException
    end
  end

  def bet(idGame, game)
    bet = ControllerBet.new
    amount = bet.createBet(@userModel.getBetId, idGame, game, @userModel.getBalance.to_f)
    @userModel.setBalance = @userModel.getBalance.to_f - amount
    @userModel.insertOpenBet(@userModel.getBetId, bet)
    @userModel.insertBetHistory(@userModel.getBetId, bet)
    @userModel.insertFollowGame(idGame, game)
    @userModel.insertHistoryGame(idGame, game)
    @userModel.incrementBetId
  end

  def getLogged
    @userModel.getLogged
  end

  def userLogout
    @userModel.setLogged = false
    @userView.loggedOut
  end

  def update(gameId, type, result, updateString)
    notification = ControllerNotification.new
    notification.createNotification(@@notificationId, type, updateString, false)
    @userModel.insertNotification(@@notificationId, notification)
    @@notificationId += 1
  end


  def endGameUpdate(gameId, result)
    @userModel.endGameUpdateOpenBets(gameId, result)
  end

  def showUnreadedNotifications
    nots = @userModel.getNotifications
    nots.each_value {|value|
      if(value.getReadedBool == false)
        puts value.readNotification
        value.setReaded=true
      end
    }
  end

  def showReadedNotifications
    nots = @userModel.getNotifications
    nots.each_value {|value|
      if(value.getReadedBool == true)
        puts value.readNotification
      end
    }
  end

end
