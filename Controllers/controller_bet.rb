require_relative '../Models/bet'
require_relative '../Views/view_bet'

class ControllerBet

  @betModel
  @betView

  def initialize
    @betModel = Bet.new
    @betView = ViewBet.new
  end

  def getBetModel
    @betModel
  end

  def getBetView
    @betView
  end

  def setBetModel=(model)
    @betModel = model
  end

  def setBetView=(view)
    @betView = view
  end


  #CRUD operations
  def createBet(betId, gameId, game, userBalance)
    temp = @betView.createBet
    array = temp.split(":")
    if(userBalance >= array[1].to_f)
      @betModel.setBetId = betId
      @betModel.setGameId = gameId
      @betModel.setGame = game
      @betModel.setType = array[0]
      @betModel.setState = "open"
      @betModel.setBetAmount = array[1].to_f
      @betModel.setOdd = game.getSelectedOdd(array[0])
      return @betModel.getBetAmount.to_f
    else
      @betView.throwNotEnoughFunds
    end
  end

  def readBet
    @betView.readBet(@betModel.getBetId, @betModel.getGameId, @betModel.getGame, @betModel.getType, @betModel.getBetAmount, @betModel.getState, @betModel.getResult)
  end

  def updateBet(betId, gameId, game, userBalance)
    temp = @betView.updateBet
    array = temp.split(":")
    if(userBalance >= array[1].to_f)
      @betModel.setBetId = betId
      @betModel.setGameId = gameId
      @betModel.setGame = game
      @betModel.setType = array[0]
      @betModel.setState = "open"
      @betModel.setBetAmount = array[1].to_f
      @betModel.setOdd = game.getSelectedOdd(array[0])
      # puts @betModel.getOdd
    else
      @betView.throwNotEnoughFunds
    end
  end

  def deleteBet(betId)
    @betView.deleteBet(@betModel.getBetId, @betModel.getGameId, @betModel.getType, @betModel.getBetAmount,@betModel.getOdd, @betModel.getResult)
  end

  def updateBetResult(gameId, result)
    if(@betModel.getGameId == gameId)
      @betModel.setState = "Finished"
      @betModel.setResult = result
      if(@betModel.getType == result)
        return (@betModel.getBetAmount.to_f * @betModel.getOdd.to_f)
      end
      else return 0.0
    end
  end

  def getGameId
    @betModel.getGameId
  end

  def getBetId
    @betModel.getBetId
  end

  def getState
    @betModel.getState
  end

end