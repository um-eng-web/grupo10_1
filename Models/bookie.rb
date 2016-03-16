require_relative '../Controllers/controller_game'
require_relative '../Models/notification'

class Bookie

  #instance variables
  @@notificationGlobalId
  @bookieName
  @password
  @logged
  @createdGames
  @followingGames
  @notifications


  #initialize
  def initialize
    @@notificationGlobalId = 0
    @bookieName = nil
    @password = nil
    @logged = false
    @createdGames = Hash.new
    @createdGames.default = ControllerGame
    @followingGames = Hash.new
    @followingGames.default = ControllerGame
    @notifications = Hash.new
    @notifications.default = Notification
  end


  #accessors
  def getBookieName
    @bookieName
  end

  def getPassword
    @password
  end

  def getLogged
    @logged
  end

  def getCreatedGames
    @createdGames
  end

  def getFollowingGames
    @followingGames
  end

  def getNotifications
    @notifications
  end

  def getNotificationGlobalId
    @@notificationGlobalId
  end


  #setters
  def setBookieName=(name)
    @bookieName = name
  end

  def setPassword=(pass)
    @password = pass
  end

  def setLogged=(log)
    @logged = log
  end

  def setCreatedGames=(cGames)
    @createdGames = cGames
  end

  def setFollowingGames=(fGames)
    @followingGames = fGames
  end

  def setNotification=(notify)
    @notifications = notify
  end


  def insertCreatedGame(gameId, game)
    @createdGames[gameId] = game
    @followingGames[gameId] = game
  end

  def insertFollowingGame(gameId, game)
    @followingGames[gameId] = game
  end

  def removeFollowedGame(gameId, game)
    @followingGames.delete(gameId)
  end

  def insertNotification(notification)
    @notifications[@@notificationGlobalId] = notification
    @@notificationGlobalId += 1
  end




end
