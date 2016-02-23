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
  def createBet(id)

  end


end