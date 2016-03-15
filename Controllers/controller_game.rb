require_relative '../Controllers/controller_odd'
require_relative '../Models/game'
require_relative '../Views/view_game'
require_relative '../subject'




class ControllerGame
  include Subject

  @gameModel
  @gameView

  def initialize
    super()
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

  def getOdds
    return @gameModel.getOdds
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
    insertOdd(creator)
    return @gameModel
    end

  def readGame
    odd = @gameModel.actualOdd
    @gameView.readGame(@gameModel.getGameId, @gameModel.getGameCreator, @gameModel.getTeam1, @gameModel.getTeam2, @gameModel.getResult, odd.to_s, @gameModel.getGameTime)
  end

  #TODO ver o que posso editar
  def updateGameOpen (creator)
    temp = @gameView.updateGameOpen
    array = temp.split(":")
    @gameModel.setTeam1 = array[0]
    @gameModel.setTeam2 = array[1]
    @gameModel.setGameTime = array[2]
    insertOdd(creator)

  end

  def updateGameFinished (creator)
    temp = @gameView.updateGameFinished
    array = temp.split(":")
    @gameModel.setResult = array[0]
  end

  def deleteGame
    odd = @gameModel.actualOdd
    @gameView.deleteGame(@gameModel.getGameId, @gameModel.getGameCreator, @gameModel.getTeam1, @gameModel.getTeam2, @gameModel.getResult, odd.to_s)
  end

  #method to insert an odd into an array of game odds
  def insertOdd (creator)
    newOdd = ControllerOdd.new
    newOdd.createOdd (creator)
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


  def getFinished
    return @gameModel.getFinished
  end

  def gameClosedToBet
    if(@gameModel.getClosedToBet)
      @gameView.gameToCloseAlreadyExists
    else
    @gameModel.setClosedToBet = true
    @gameView.successGameClosedToBet
    end

  end

  def endGame (result)
    if(@gameModel.getFinished)
      @gameView.gameToEndAlreadyExists
    else
      @gameModel.setClosedToBet = true
      @gameModel.setFinished = true
      @gameModel.setResult = result
      @gameView.successGameEndedToBet
    end
    end

  def listOddsGame
      @gameView.printOdds(@gameModel.getOdds)
    end


  def getObs
    @gameView.printObservers(getObservers)
  end

  def gamesUnfollowBookie(bookiename)
    if @gameModel.getObservers.include?(bookiename)
      return false
    else
      return true
    end
  end

  def gamesFollowBookie(bookiename)
    if @gameModel.getObservers.include?(bookiename)
      return true
    else
      return false
    end
  end

  #Observer Pattern method
  def addObserver(bookiename)
    registerObserver(bookiename)
  end

  #Observer pattern method
  #TODO falta testar
  def remObserver(bookiename)
    index = @observers.index(bookiename)
    removeObserver(index)
  end

  #TODO acabar isto
  def notObservers
    notifyObservers("Hell","HELLO")
  end

end
