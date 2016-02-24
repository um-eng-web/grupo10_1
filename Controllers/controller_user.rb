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
    @userView.readUser(@userModel.getUsername, @userModel.getName, @userModel.getBalance, @userModel.getLogged, @userModel.getOpenBets.length, @userModel.getFollowingGames.length)
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

  #authenticate method
  def authenticateUser(username, password)
    if (@userModel.getUsername == username && @userModel.getPassword == password && @userModel.getLogged == false)
      @userModel.setLogged = true
    end
  end

  #follow game method
  def followGame(game_id, game)
    if (@userModel.getFollowingGames.has_key? (game_id)) == false
      @userModel.insertFollowGame(game_id, game)
    end
  end




end
