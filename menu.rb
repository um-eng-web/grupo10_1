require_relative 'bet_house_API'

class Menu

  @house

  def initialize
    @house = BetHouseAPI.new
  end

  def getHouse
    @house
  end

  def menuAuthReg
    puts "BetESS Ruby"
    puts "Authentication/Registration:"
    puts "1- User"
    puts "2- Bookie"
    puts "3- Create User"
    puts "4- Create Bookie"
    puts "0- Close"

    option = gets.to_i
    case option
      when 1
        username = @house.authenticateUser
        if(username != nil)
          menuUser(username)
        else
          menuAuthReg
        end
      when 2
        bookiename = @house.authenticateBookie
        if(bookiename != nil)
          menuBookie(bookiename)
        else
          menuAuthReg
        end
      when 3
        @house.registerUser
        menuAuthReg
      when 4
        @house.registerBookie
        menuAuthReg
      when 0
        nil
    end
  end

  #TODO insert logout option
  def menuUser(username)
    puts "Welcome, #{username}"
    puts "1- Bet"
    puts "2- Follow Game"
    puts "3- Unfollow Game"
    puts "4- Notifications"
    puts "5- List Menu"
    puts "6- Profile"
    puts "7- Transact BetCoins"
    puts "8- Change Password"
    puts "9- Logout"
    puts "0- Back"

    option = gets.to_i
    case option
      when 1
        @house.createBet(username)
        menuUser(username)
      when 2
        @house.followGameUser(username)
        menuUser(username)
      when 3
        @house.unfollowGameUser(username)
        menuUser(username)
      when 4
        #notifications
        menuUser(username)
      when 5
        listMenuUser(username)
        menuUser(username)
      when 6
        #@house.
        menuUser(username)
      when 7
        @house.transactionBetCoinsUser(username)
        menuUser(username)
      when 8
        @house.changePassawordUser(username)
        menuUser(username)
      when 9
        puts "Logout efectuado com sucesso"
        return

      when 0
        menuAuthReg
    end
  end

  def listMenuUser(username)
    puts "#{username} - List Menu"
    puts "1- List Active Games"
    puts "2- List Active Bets"
    puts "3- List Following Games"
    puts "4- List All Notifications"
    puts "5- List Bet History"
    puts "0- Back"

    option = gets.to_i
    case option
      when 1
        @house.showActiveGames
        listMenuUser(username)
      when 2
        @house.showOpenBetsUser(username)
        listMenuUser(username)
      when 3
        @house.showFollowingGamesUser(username)
        listMenuUser(username)
      when 4
        #@house.showAllNotificationsUser(username)
        listMenuUser(username)
      when 5
        @house.showBetsHistoryUser(username)
        listMenuUser(username)
      when 0
        menuUser(username)
    end
  end

  #TODO insert logout option
  def menuBookie(bookiename)
    puts "Welcome, #{bookiename}"
    puts "1- Create Game"
    puts "2- Close Game Bet"
    puts "3- End Game"
    puts "4- Notifications"
    puts "5- Edit Game"
    puts "6- Delete Game"
    puts "7- Follow Game"
    puts "8- Unfollow Game"
    puts "9- List Menu"
    puts "0- Back"

    option = gets.to_i
    case option
      when 1
        @house.createGame(bookiename)
        menuBookie(bookiename)
      when 2
        #closeGameBet
        menuBookie(bookiename)
      when 3
        #endGame
        menuBookie(bookiename)
      when 4
        #notifications
        menuBookie(bookiename)
      when 5
        #editGame/updateGame
        menuBookie(bookiename)
      when 6
        #deleteGame
        menuBookie(bookiename)
      when 7
        #followGameBookie
        menuBookie(bookiename)
      when 8
        #unfollowGameBookie
        menuBookie(bookiename)
      when 9
        listMenuBookie(bookiename)
      when 0
        menuAuthReg
    end
  end

  def listMenuBookie(bookiename)
    puts "#{bookiename} - List Menu"
    puts "1- List Active Games"
    puts "2- List Following Games"
    puts "3- List Created Games"
    puts "4- List Games History"
    puts "5- List Online Users"
    puts "6- List All Users"
    puts "7- List Odds"
    puts "8- List Notifications"
    puts "0- Back"

    option = gets.to_i
    case option
      when 1
        @house.showActiveGames
        listMenuBookie(bookiename)
      when 2
        @house.showFollowingGamesBookie(bookiename)
        listMenuBookie(bookiename)
      when 3
        @house.showCreatedGamesBookie(bookiename)
        listMenuBookie(bookiename)
      when 4
        #gamesHistory
        listMenuBookie(bookiename)
      when 5
        #online users
        listMenuBookie(bookiename)
      when 6
        #all users
        listMenuBookie(bookiename)
      when 7
        #list odds
        listMenuBookie(bookiename)
      when 8
        #notifications
        listMenuBookie(bookiename)
      when 0
        menuBookie(bookiename)
    end
  end

end

t = Menu.new
t.menuAuthReg