require_relative '../Controllers/controller_odd'
require_relative '../Models/game'
require_relative '../Views/view_game'

class ControllerGame

  @gameModel
  @gameView

  def initialize
    @gameModel = Game.new
    @gameView = ViewGame.new
  end

  def getGameModel
    @gameModel
  end

  def getGameView
    @gameView
  end

  def setGameModel=(model)
    @gameModel = model
  end

  def setGameView=(view)
    @gameView = view
  end


  #CRUD operations
  def createGame(id, creator)
    temp = @gameView.createGame
    array = temp.split(":")
    @gameModel.setGameId = id.to_i
    @gameModel.setGameCreator = creator
    @gameModel.setTeam1 = array[0]
    @gameModel.setTeam2 = array[1]
    @gameModel.setGameTime = array[3]
    insertOdd
  end

  def readGame
    odd = @gameModel.actualOdd
    @gameView.readGame(@gameModel.getGameId, @gameModel.getGameCreator, @gameModel.getTeam1, @gameModel.getTeam2, @gameModel.getResult, odd.to_s, @gameModel.getGameTime)
  end


  def insertOdd
    newOdd = ControllerOdd.new
    newOdd.createOdd
    @gameModel.insertOdd(newOdd)
  end


end

g = ControllerGame.new
g.createGame(0,"mister")
g.readGame