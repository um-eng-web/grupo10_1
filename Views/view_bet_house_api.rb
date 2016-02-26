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
    puts "Error: Username does not exists!"
    end

  def throwBookieNotExistError
    puts "Error: Bookie does not exists!"
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

end