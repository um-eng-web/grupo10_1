class ViewBetHouseAPI

  def authenticateUser
    puts "Insert your username and password: (username:password)"
    return gets.chomp
    end

  def authenticateBookie
    puts "Insert your bookiename and password: (bookiename:password)"
    return gets.chomp
  end

  def throwUsernameNotExistError
    puts "Error: Username does not exists or password is incorrect!"
    end

  def throwBookieNotExistError
    puts "Error: Bookie does not exists or password is incorrect!"
  end

  def chooseGameId
    puts "Choose the game id: (id)"
    return gets.chomp
  end

  def balanceAfterTransaction(balance)
    puts "Your balance is #{balance}."
  end

  def selectTransactionalMode
    puts "Select the transactional mode: (deposit or withdrawal)"
    return gets.chomp
  end

  def throwGameNotExistError
    puts "ERROR: The game you have selected does not exists."
  end

  def throwGameClosedToBetError
    puts "ERROR: The game you have selected has already started."
  end

  def throwUsernameAlreadyExists
    puts "ERROR: Choose another username."
  end

  def throwPasswordAlreadyExists
    puts "ERROR: Choose another password."
  end

  def throwGameToCloseNotExists
    puts "ERROR: Choose another Game."
  end


  def gameClosetoBet
    puts "Insert the ID of the game you want to end the bets"
    return gets.chomp.to_i
  end

  def gameEnded
    puts "Insert the ID of the game you want to end"
    return gets.chomp.to_i
  end

  def gameDelete
    puts "Insert the ID of the game you want to delete"
    return gets.chomp.to_i
  end

  def throwGameDeleted
    puts"Game successfully Removed"
  end

  def gameUpdate
    puts "Insert the ID of the game you want to update"
    return gets.chomp.to_i
  end

  def listOddsGame
    puts "Insert the ID of the game you want to list the odds"
    return gets.chomp.to_i
  end
  def insertResult
    puts "Insert the result of the game you want to end, please."
    return gets.chomp
  end

  def throwUnavailableGame
    puts "This game is not available to be updated."
  end

  def throwGameAlreadyFollowed
    puts"You already followed the game you've choosed or you can't follow it"
  end

  def throwGameAlreadyUnfollowed
    puts"You already unfollowed the game you've choosed or you can't unfollow it"
  end
end