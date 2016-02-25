require_relative 'Controllers/controller_user'
require_relative 'Controllers/controller_odd'
require_relative 'Controllers/controller_game'
require_relative 'Controllers/controller_bet'
require_relative 'Views/view_bet_house_api'


class BetHouseAPI

  @@gameGlobalId
  @users
  @games
  @betHouseView

  def initialize
    @@gameGlobalId = 0
    @users = Hash.new
    @users.default = ControllerUser
    @games = Hash.new
    @games.default = ControllerGame
    @betHouseView = ViewBetHouseAPI.new
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

  def authenticateUser
    temp = @betHouseView.authenticate
    array = temp.split(":")
    if @users.has_key?(array[0])
      @users[array[0]].authenticateUser(array[0],array[1])
    else
      @betHouseView.throwUsernameNotExistError
    end

  end

  def followGameUser(username)
    @games.each_value{|value| value.readGame}
    gId = @betHouseView.chooseGameId.to_i
    game = @games[gId]
    @users[username].followGame(gId, game)
  end

  def unfollowGameUser(username)
    @users[username].unfollowGame
  end

  def showFollowingGamesUser(username)
    @users[username].showFollowingGames
  end

  def showHistoryGamesUser(username)
    @users[username].showHistoryGames
  end

  #TODO mudar a logica para o lado do user (esta na BetHouseAPI)
  def transactionBetCoinsUser(username)
    mode = @betHouseView.selectTransactionalMode
    @betHouseView.balanceAfterTransaction(@users[username].transactionBetCoins(mode))
  end

  def changePassawordUser(username)
    @users[username].changePassword
  end


  #TODO showOpenBetsUser, showHistoryGamesUser
  def showOpenBetsUser(username)
    @users[username].showOpenBets
  end

  def showBetsHistoryUser(username)
    @users[username].showBetsHistory
  end

  #bookie interface
  def createGame(creator)
    newGame = ControllerGame.new
    newGame.createGame(@@gameGlobalId, creator)
    @games.store(@@gameGlobalId, newGame)
    @@gameGlobalId+=1
  end


  #bet interface
  #TODO ver melhor as exceptions (montante nao suficiente, etc etc)
  def createBet(username)
    @games.each_value{|value| value.readGame}
    gId = @betHouseView.chooseGameId.to_i
    game = @games[gId]
    @users[username].bet(gId, game)
  end



end
house = BetHouseAPI.new
house.registerUser #voluntario:4:ricardo:4321
#house.registerUser #zde:12:zé:123
#house.registerUser #basofe:64:helder:123
#house.removeUser("basofe")
#house.viewUsers

house.authenticateUser  #voluntario:4
house.viewUsers

#house.createGame("velhote") #Sporting:braga:t1   #velhote:1:2:3
house.createGame("velhote") #Arsenal:Barcelona:t2   #outro:2:3:4

#house.followGameUser("voluntario")
#house.showFollowingGamesUser("voluntario")
#puts "---------------------"
#house.unfollowGameUser("voluntario")
#house.showFollowingGamesUser("voluntario")
puts "---------------------"
#house.transactionBetCoinsUser("voluntario")
#house.transactionBetCoinsUser("voluntario")
puts "---------------------"
#house.changePassawordUser("voluntario")

puts "---------------------"
house.createBet("voluntario")
puts "OpenBetsUser"
house.showOpenBetsUser("voluntario")
puts "BetsHistoryUser"
house.showBetsHistoryUser("voluntario")
