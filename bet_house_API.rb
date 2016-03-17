require_relative 'Controllers/controller_user'
require_relative 'Controllers/controller_odd'
require_relative 'Controllers/controller_game'
require_relative 'Controllers/controller_bet'
require_relative 'Controllers/controller_bookie'
require_relative 'Views/view_bet_house_api'


class BetHouseAPI

  @@gameGlobalId
  @users
  @bookies
  @games
  @betHouseView

  def initialize
    @@gameGlobalId = 0
    @users = Hash.new
    @users.default = ControllerUser
    @bookies = Hash.new
    @bookies.default = ControllerBookie
    @games = Hash.new
    @games.default = ControllerGame
    @betHouseView = ViewBetHouseAPI.new
  end

  def getGameGlobalId
    @@gameGlobalId
  end

  def getUsers
    @users
  end

  def getBookies
    @bookies
  end

  def getGames
    @games
  end

  def getBetHouseView
    @betHouseView
  end


  #USERS INTERFACE
  def registerUser
    newUser = ControllerUser.new
    newUser.createUser
    if(@users.has_key?(newUser.getUserModel.getUsername) == false)
      @users[newUser.getUserModel.getUsername] = newUser
      else @betHouseView.throwUsernameAlreadyExists
    end
  end

  def viewUsers
    @users.each_value{|u| u.readUser}
  end

  def removeUser(username)
    @users[username].deleteUser
    @users.delete(username)
  end

  def authenticateUser
    temp = @betHouseView.authenticateUser
    array = temp.split(":")
    if(@users.has_key?(array[0]) && @users[array[0]].authenticateUser(array[0],array[1]))
      return array[0]
    else
      @betHouseView.throwUsernameNotExistError
    end
  end

  def showFollowingGamesUser(username)
    @users[username].showFollowingGames
  end

  def showHistoryGamesUser(username)
    @users[username].showHistoryGames
  end

  def showOpenBetsUser(username)
    @users[username].showOpenBets
  end

  def showBetsHistoryUser(username)
    @users[username].showBetsHistory
  end

  def changePassawordUser(username)
    @users[username].changePasswordUser
  end

  def userLogout(username)
    @users[username].userLogout
  end

  def createBet(username)
    showActiveGames
    gId = @betHouseView.chooseGameId.to_i
    if(@games.has_key?(gId))
      game = @games[gId]
      if(game.getClosedToBet == false)
        @users[username].bet(gId, game)
        @games[gId].addObserver(@users[username])
      else
        @betHouseView.throwGameClosedToBetError
      end
    else
      @betHouseView.throwGameNotExistError
    end
  end

  def followGameUser(username)
    showActiveGames
    gId = @betHouseView.chooseGameId.to_i
    game = @games[gId]
    @games[gId].addObserver(@users[username])
    @users[username].followGame(gId, game)
  end

  def getGameObservers
    showActiveGames
    gId = @betHouseView.chooseGameId.to_i
    @games[gId].getObs
  end


  def unfollowGameUser(username)
    @users[username].unfollowGame
  end

  def transactionBetCoinsUser(username)
    mode = @betHouseView.selectTransactionalMode
    @betHouseView.balanceAfterTransaction(@users[username].transactionBetCoins(mode))
  end




  #BOOKIE INTERFACE
  def registerBookie
    newBookie = ControllerBookie.new
    newBookie.createBookie
    if(@bookies.has_key?(newBookie.getBookieModel.getBookieName) == false)
      @bookies[newBookie.getBookieModel.getBookieName] = newBookie
    else @betHouseView.throwUsernameAlreadyExists
    end
  end

  def viewBookies
    @bookies.each_value{|value| puts value.readBookie}
  end

  def authenticateBookie
    temp = @betHouseView.authenticateBookie
    array = temp.split(":")
    if @bookies.has_key?(array[0]) && @bookies[array[0]].authenticateBookie(array[0],array[1])
      return array[0]
    else
      @betHouseView.throwBookieNotExistError
    end
  end

  def showFollowingGamesBookie(bookie)
    @bookies[bookie].showFollowingGames
  end

  def showCreatedGamesBookie(bookie)
    @bookies[bookie].showCreatedGames
  end

  def showActiveUnfollowGamesBookie(bookiename)
    @games.each_value{|value|
      if(value.getFinished == false && value.gamesUnfollowBookie(bookiename))
        value.readGame
      end
    }
  end

  def bookieLogout(bookie)
    @bookies[bookie].bookieLogout
  end

  def changePassawordBookie(bookie)
    @bookies[bookie].changePasswordBookie
  end


  def gameUpdate (bookiename)
    showActiveGames
    temp = @betHouseView.gameUpdate
    if @games.has_key?(temp)
      if @games[temp].getFinished
        @games[temp].updateGameFinished(bookiename)
        @games[temp].notObservers(temp, "Game Updated", "nulo", "O jogo #{temp} foi editado por #{bookiename}")
      elsif @games[temp].getClosedToBet
        @betHouseView.throwUnavailableGame
      else
        @games[temp].updateGameOpen (bookiename)
        @games[temp].notObservers(temp, "Game Updated", "nulo", "O jogo #{temp} foi editado por #{bookiename}")
      end
    else
      @betHouseView.throwGameToCloseNotExists
    end
  end



  def createGame(creator)
    newGame = @bookies[creator].createGame(@@gameGlobalId)
    @games[@@gameGlobalId] = newGame
    @games[@@gameGlobalId].addObserver(@bookies[creator])
    @@gameGlobalId+=1
  end

  def gameCloseToBet
    showActiveGames
    temp = @betHouseView.gameClosetoBet
    if @games.has_key?(temp)
      @games[temp].gameClosedToBet
      @games[temp].notObservers(temp, "Closed To Bet", "nulo", "Já não é possível apostar no jogo #{temp}. ClosedToBet ativado.")
    else
      @betHouseView.throwGameToCloseNotExists
    end
  end

  def gameEnded
    showActiveGames
    temp = @betHouseView.gameEnded
    if @games.has_key?(temp)
      result = @betHouseView.insertResult

      @users.each_value {|value| value.endGameUpdate(temp, result)}


      @games[temp].notObservers(temp, "Game Ended",result, "O jogo #{temp} acabou e o resultado final foi #{result}")
      @games[temp].endGame(result)
    else
      @betHouseView.throwGameToCloseNotExists
    end
  end

  def removeGame(bookie)
    showActiveGames
    temp = @betHouseView.gameDelete
    if @games.has_key?(temp)
      @games.delete(temp)
      @bookies[bookie].removeCreatedGame(temp)
      @betHouseView.throwGameDeleted
    else
      @betHouseView.throwGameToCloseNotExists
    end
  end

  def chooseGameToFollow(bookiename)
    showActiveUnfollowGamesBookie(bookiename)
    game = @betHouseView.chooseGameId.to_i
    if @games.has_key?(game) && @games[game].gamesUnfollowBookie(bookiename)
      @bookies[bookiename].followGame(@games[game])
      @games[game].addObserver(@bookies[bookiename])
    else
      @betHouseView.throwGameAlreadyFollowed
    end
  end


  def chooseGameToUnfollow(bookiename)
    showFollowingGamesBookie(bookiename)
    game = @betHouseView.chooseGameId.to_i
    if @games.has_key?(game) && @games[game].gamesFollowBookie(bookiename)
      @bookies[bookiename].unfollowGame(@games[game])
      @games[game].remObserver(@bookies[bookiename])
    else
      @betHouseView.throwGameAlreadyUnfollowed
    end
  end



  #GAME, BET and ODD INTERFACE
  def showActiveGames
    @games.each_value{|value|
      if(value.getFinished == false)
        value.readGame
      end
      }
  end

  def chooseGameById
    @betHouseView.chooseGameId.to_i
  end

  def showHistoryGames
    @games.each_value{|value|
      if(value.getFinished == true)
        value.readGame
      end
    }
  end

  def showListOddsOfAGame
    showActiveGames
    showHistoryGames
    temp = @betHouseView.listOddsGame
    if @games.has_key?(temp)
      @games[temp].listOddsGame
    else
      @betHouseView.throwGameToCloseNotExists
    end
  end

  def showOnlineUsers
    puts "Online Users:"
    @users.each_value{|value|
      if(value.getLogged == true)
        value.readUser
      end
    }
  end

  def showAllUsers
    puts "All Users:"
    @users.each_value{|value| value.readUser}
  end

  def showUserNotificationsReaded(username)
    @users[username].showReadedNotifications
  end

  def showUserNotificationsUnreaded(username)
    @users[username].showUnreadedNotifications
  end

  def showBookieNotificationsReaded(bookiename)
    @bookies[bookiename].showReadedNotifications
  end

  def showBookieNotificationsUnreaded(bookiename)
    @bookies[bookiename].showUnreadedNotifications
  end
end