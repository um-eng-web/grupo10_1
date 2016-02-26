require_relative '../Models/bookie'
require_relative '../Views/view_bookie'

class ControllerBookie

  @bookieModel
  @bookieView

  def initialize
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

  #TODO testar isto
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


  #TODO testar isto
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
    end
  end

  #method to show the following games
  def showFollowingGames
    followed = @bookieModel.getFollowingGames
    followed.each_value{|value| puts value.readGame}
  end

  #method to show the created games
  def showCreatedGames
    created = @bookieModel.getCreatedGames
    created.each_value{|value| puts value.readGame}
  end

end