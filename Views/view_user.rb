class ViewUser

  def createUser
    puts "Insira os dados do utilizador (username:password:name:balance):"
    return gets.chomp
  end

  def readUser(username, name, balance, logged, activeBetsNumber, followingNumber)
    puts "#:#:#:#:#:#:#:#:#:#:#:#:#:"
    puts "Username ::  #{username}"
    puts "Name :: #{name}"
    puts "Balance :: #{balance}"
    puts "Logged :: #{logged}"
    puts "Number of Active Bets :: #{activeBetsNumber}"
    puts "Number of Following Games :: #{followingNumber}"
  end

  def updateUser
    puts "Insira os dados do utilizador (username:name):"
    return gets.chomp
  end

  def deleteUser(username, name, balance)
    puts "User removed. (#{username} - #{name} - #{balance})"
  end

  def selectUnfollowGame
    puts "Select the id to unfollow game: (id)"
    return gets.chomp
  end

  def transactionBetCoins
    puts "Insert the betCoins amount: (amount)"
    return gets.chomp
  end

  def changePassword
    puts "Insert Old Password: (oldPassword)"
    old = gets.chomp
    puts "Insert New Password: (newPassword)"
    new = gets.chomp
    puts "Confirm New Password: (confirmPassword)"
    confirm = gets.chomp
    return old, new, confirm
  end

  def throwNewPasswordException
    puts "ERROR: Incorrect Password."
  end

  def loggedOut
    puts "Logout successfully done"
  end

end

