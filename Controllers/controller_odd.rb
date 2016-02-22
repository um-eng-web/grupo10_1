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
  def createOdd
    temp = @oddView.createOdd
    array = temp.split(":")
    @oddModel.setBookieName = array[0]
    @oddModel.setOdd1 = array[1]
    @oddModel.setOddX = array[2]
    @oddModel.setOdd2 = array[3]
    @oddModel.setTimestamp = Time.new
  end

  def readOdd
    @oddView.readOdd(@oddModel.getBookieName, @oddModel.getOdd1, @oddModel.getOddX, @oddModel.getOdd2, @oddModel.getTimestamp)
  end

end