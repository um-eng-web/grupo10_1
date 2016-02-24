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

end