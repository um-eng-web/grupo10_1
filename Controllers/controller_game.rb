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
    @gameModel.setGameTime = array[2]
    insertOdd
  end

  def readGame
    odd = @gameModel.actualOdd
    @gameView.readGame(@gameModel.getGameId, @gameModel.getGameCreator, @gameModel.getTeam1, @gameModel.getTeam2, @gameModel.getResult, odd.to_s, @gameModel.getGameTime)
  end

  #TODO ver o que posso editar
  def updateGame
    temp = @gameView.updateGame
    array = temp.split(":")
    @gameModel.setGameId = array[0].to_i
    @gameModel.setGameCreator = array[1]
    @gameModel.setTeam1 = array[2]
    @gameModel.setTeam2 = array[3]
    @gameModel.setGameTime = array[4]
  end

  def deleteGame
    odd = @gameModel.actualOdd
    @gameView.deleteGame(@gameModel.getGameId, @gameModel.getGameCreator, @gameModel.getTeam1, @gameModel.getTeam2, @gameModel.getResult, odd.to_s)
  end

  #method to insert an odd into an array of game odds
  def insertOdd
    newOdd = ControllerOdd.new
    newOdd.createOdd
    @gameModel.insertOdd(newOdd)
  end

  #method to remove an odd from an array of game odds
  def removeOdd
    arrayOdd = @gameModel.getOdds
    removeIndex = @gameView.printOddArray(arrayOdd)
    removeOdd = arrayOdd.at(removeIndex)
    removeOdd.deleteOdd
    @gameModel.removeOdd(removeIndex)
  end

  #method to get the value of the bet
  #TODO corrigir else
  def getSelectedOdd(oddType)
    mostRecent = @gameModel.actualOdd
    if(oddType == "1"|| oddType == "X" || oddType == "2")
      mostRecent.getSelectedOdd(oddType)
    else
      puts "ERROOOROROOROROR"
    end
  end

  def getClosedToBet
    return @gameModel.getClosedToBet
  end

end

#g = ControllerGame.new
#g.createGame(0,"mister") #spoting:braga:qwe   mister:1:2:3
#g.readGame
#g.insertOdd #outro:2:3:4
#g.removeOdd