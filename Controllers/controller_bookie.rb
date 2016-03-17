require_relative '../Models/bookie'
require_relative '../Views/view_bookie'
require_relative '../observer'
require_relative '../Controllers/controller_notification'

class ControllerBookie < Observer
  @@notificationId
  @bookieModel
  @bookieView

  def initialize
    @@notificationId = 1
    @bookieModel = Bookie.new
    @bookieView = ViewBookie.new
  end

  def getBookieModel
    @bookieModel
  end

  def getBookieView
    @bookieView
  end

  def setBookieModel=(model)
    @bookieModel = model
  end

  def setBookieView=(view)
    @bookieView = view
  end

  #CRUD methods
  def createBookie
    temp = @bookieView.createBookie
    array = temp.split(":")
    @bookieModel.setBookieName = array[0]
    @bookieModel.setPassword = array[1]
  end

  def readBookie
    @bookieView.readBookie(@bookieModel.getBookieName, @bookieModel.getLogged, @bookieModel.getCreatedGames.length, @bookieModel.getFollowingGames.length)
  end

  def updateBookie
    temp = @bookieView.updateBookie
    array = temp.split(":")
    @bookieModel.setBookieName = array[0]
    @bookieModel.setPassword = array[1]
  end

  def deleteBookie
    @bookieModel.deleteBookie(@bookieModel.getBookieName)
  end


  #create game method
  def createGame(gameId)
    newGame = ControllerGame.new
    newGame.createGame(gameId, @bookieModel.getBookieName)
    @bookieModel.insertCreatedGame(gameId, newGame)
    return newGame
  end

  #authenticate method
  def authenticateBookie(bookiename, password)
    if (@bookieModel.getBookieName == bookiename && @bookieModel.getPassword == password && @bookieModel.getLogged == false)
      @bookieModel.setLogged = true
      return true
    else
      return false
    end
  end

  #method to show the following games
  def showFollowingGames
    followed = @bookieModel.getFollowingGames
    followed.each_value{|value| puts value.readGame}
  end

  def followGame(game)
    @bookieModel.insertFollowingGame(game.getGameModel.getGameId,game)
  end

  def unfollowGame(game)
    @bookieModel.removeFollowedGame(game.getGameModel.getGameId,game)
  end
  #
  #method to show the created games
  def showCreatedGames
    created = @bookieModel.getCreatedGames
    created.each_value{|value| puts value.readGame}
  end

  def removeCreatedGame(gameId)
    @bookieModel.getCreatedGames.delete(gameId)
  end

  def bookieLogout
    @bookieModel.setLogged = false
    @bookieView.loggedOut
  end

  def changePasswordBookie
    passwords = @bookieView.changePassword
    if (passwords[0] == @bookieModel.getPassword && passwords[1] == passwords[2])
      @bookieModel.setPassword = passwords[1]
    else
      @bookieView.throwNewPasswordException
    end
  end


  def update(gameId, type, result, updateString)
    notification = ControllerNotification.new
    notification.createNotification(@@notificationId, type, updateString, false)
    @bookieModel.insertNotification(@@notificationId, notification)
    @@notificationId += 1
  end


  def showUnreadedNotifications
    nots = @bookieModel.getNotifications
    nots.each_value {|value|
      if(value.getReadedBool == false)
          value.readNotification
          value.setReaded=true
      end
      }
  end


  def showReadedNotifications
    nots = @bookieModel.getNotifications
    nots.each_value {|value|
      if(value.getReadedBool == true)
        puts value.readNotification
      end
    }
  end


end