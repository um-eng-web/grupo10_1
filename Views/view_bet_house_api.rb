class ViewBetHouseAPI

  def authenticate
    puts "Insert your username and password: (username:password)"
    return gets.chomp
  end

  def throwUsernameNotExistError
    puts "Error: Username does not exists!"
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


end