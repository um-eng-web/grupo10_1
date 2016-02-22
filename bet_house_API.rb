require_relative 'Controllers/controller_user'
require_relative 'Models/user'
require_relative 'Views/view_user'

class BetHouseAPI
  @@betGlobalId
  @@gameGlobalId
  @users

  def initialize
    @@betGlobalId = 0
    @@gameGlobalId = 0
    @users = Hash.new
    @users.default = ControllerUser
  end

  #users interface
  def registerUser
    newUser = ControllerUser.new
    newUser.createUser
    @users[newUser.getUserModel.getUsername] = newUser
  end

  def viewUsers
    @users.each_value{|u| u.readUser}
  end

  def removeUser(username)
    @users[username].deleteUser
    @users.delete(username)
  end

end
house = BetHouseAPI.new
house.registerUser #voluntario:4:ricardo:4321
house.registerUser #zde:12:zé:123
house.registerUser #basofe:64:helder:123

house.viewUsers

house.removeUser("basofe")
house.viewUsers