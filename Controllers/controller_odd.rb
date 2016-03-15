require_relative '../Models/odd'
require_relative '../Views/view_odd'

class ControllerOdd
  @oddModel
  @oddView

  def initialize
    @oddModel = Odd.new
    @oddView = ViewOdd.new
  end

  #accessors
  def getOddModel
    @oddModel
  end

  def getOddView
    @oddView
  end

  #setters
  def setOddModel=(model)
    @oddModel = model
  end

  def setOddView=(view)
    @oddView = view
  end


  #CRUD methods
  def createOdd (creator)
    temp = @oddView.createOdd
    array = temp.split(":")
    @oddModel.setBookieName = creator
    @oddModel.setOdd1 = array[0]
    @oddModel.setOddX = array[1]
    @oddModel.setOdd2 = array[2]
    @oddModel.setTimestamp = Time.new
  end

  def readOdd
    @oddView.readOdd(@oddModel.getBookieName, @oddModel.getOdd1, @oddModel.getOddX, @oddModel.getOdd2, @oddModel.getTimestamp)
  end


  #TODO ver o que posso editar
  def updateOdd
    temp = @oddView.updateOdd
    array = temp.split(":")
    @oddModel.setOdd1 = array[0]
    @oddModel.setOddX = array[1]
    @oddModel.setOdd2 = array[2]
    @oddModel.setTimestamp = Time.new
  end

  def deleteOdd
    @oddView.deleteOdd(@oddModel.getBookieName, @oddModel.getOdd1, @oddModel.getOddX, @oddModel.getOdd2)
  end


  #method to get a specific odd
  def getSelectedOdd(type)
    if(type == "1")
      return @oddModel.getOdd1
    elsif(type == "X")
      return @oddModel.getOddX
    else
      return @oddModel.getOdd2
    end
  end


  #toString method
  def to_s
    return "Creator: #{@oddModel.getBookieName}, Odd1: #{@oddModel.getOdd1}, OddX: #{@oddModel.getOddX}, Odd2: #{@oddModel.getOdd2}, Timestamp: #{@oddModel.getTimestamp}"
  end

end