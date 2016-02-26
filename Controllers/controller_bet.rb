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
     # puts @betModel.getOdd
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


end