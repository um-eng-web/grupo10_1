require_relative '../Models/user'
require_relative '../Views/view_user'

class ControllerUser

  #instance variables
  @userModel
  @userView

  #initialize method
  def initialize
      @userModel = User.new
      @userView = ViewUser.new
  end

  #accessors
  def getUserModel
    @userModel
  end

  def getUserView
    @userView
  end

  #setters
  def setUserModel=(userM)
    @userModel = userM
  end

  def setUserView=(userV)
    @userView = userV
  end


  #methods
  #CRUD operations
  def createUser
    var = @userView.createUser
    array = var.split(":")
    @userModel.setUsername =array[0]
    @userModel.setPassword = array[1]
    @userModel.setName = array[2]
    @userModel.setBalance = array[3].to_f
  end

  def readUser
    @userView.readUser(@userModel.getUsername, @userModel.getName, @userModel.getBalance)
  end

  def updateUser
    var = @userView.updateUser
    array = var.split(":")
    @userModel.setUsername =array[0]
    @userModel.setPassword = array[1]
    @userModel.setName = array[2]
    @userModel.setBalance = array[3].to_f
  end

  def deleteUser
    @userView.deleteUser(@userModel.getUsername, @userModel.getName, @userModel.getBalance)
  end

  #authenticate
  def authenticateUser(username, password)
    if (@username ==username && @password == password)
      @logged = true
    end
    puts @logged
  end




end
