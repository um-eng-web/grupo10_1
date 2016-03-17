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
      else
        puts "Invalid Option"
        menuAuthReg
    end
  end

  def menuUser(username)
    puts "Welcome, #{username}"
    puts "1- Bet"
    puts "2- Follow Game"
    puts "3- Unfollow Game"
    puts "4- Notifications"
    puts "5- List Menu"
    puts "6- Show Profile"
    puts "7- Transact BetCoins"
    puts "8- Change Password"
    puts "9- Logout"

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
        @house.showUserNotificationsUnreaded(username)
        menuUser(username)
      when 5
        listMenuUser(username)
        menuUser(username)
      when 6
        @house.getUsers[username].readUser
        menuUser(username)
      when 7
        @house.transactionBetCoinsUser(username)
        menuUser(username)
      when 8
        @house.changePassawordUser(username)
        menuUser(username)
      when 9
        @house.userLogout(username)
        menuAuthReg
      else
        puts"Invalid Option"
        menuUser(username)
    end
  end

  def listMenuUser(username)
    puts "#{username} - List Menu"
    puts "1- List Active Games"
    puts "2- List Active Bets"
    puts "3- List Following Games"
    puts "4- List Notifications History"
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
        @house.showUserNotificationsReaded(username)
        listMenuUser(username)
      when 5
        @house.showBetsHistoryUser(username)
        listMenuUser(username)
      when 0
        menuUser(username)
      else
        puts"Invalid Option"
        listMenuUser(username)
    end
  end

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
    puts "9- Change Password"
    puts "10- List Menu"
    puts "11- Logout"

    option = gets.to_i
    case option
      when 1
        @house.createGame(bookiename)
        menuBookie(bookiename)
      when 2
        @house.gameCloseToBet
        menuBookie(bookiename)
      when 3
        @house.gameEnded
        menuBookie(bookiename)
      when 4
        @house.showBookieNotificationsUnreaded(bookiename)
        menuBookie(bookiename)
      when 5
        @house.gameUpdate (bookiename)
        menuBookie(bookiename)
      when 6
        @house.removeGame (bookiename)
        menuBookie(bookiename)
      when 7
        @house.chooseGameToFollow(bookiename)
        menuBookie(bookiename)
      when 8
        @house.chooseGameToUnfollow(bookiename)
        menuBookie(bookiename)
      when 9
        @house.changePassawordBookie(bookiename)
        menuBookie(bookiename)
      when 10
        listMenuBookie(bookiename)
      when 11
        @house.bookieLogout(bookiename)
        menuAuthReg

      else
        puts"Invalid Option"
        menuBookie(bookiename)
    end
  end

  def listMenuBookie(bookiename)
    puts "#{bookiename} - List Menu"
    puts "1- List Active Games"
    puts "2- List Following Games"
    puts "3- List Created Games"
    puts "4- List Games History"
    puts "5- List Game's Odds History"
    puts "6- List Online Users"
    puts "7- List All Users"
    puts "8- List Notifications History"
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
        @house.showHistoryGames
        listMenuBookie(bookiename)
      when 5
        @house.showListOddsOfAGame
        listMenuBookie(bookiename)
      when 6
        @house.showOnlineUsers
        listMenuBookie(bookiename)
      when 7
        @house.showAllUsers
        listMenuBookie(bookiename)
      when 8
        @house.showBookieNotificationsReaded(bookiename)
        listMenuBookie(bookiename)
      when 0
        menuBookie(bookiename)
    end
  end

end

t = Menu.new
t.menuAuthReg