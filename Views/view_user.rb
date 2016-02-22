class ViewUser

  #TODO fazer as views CRUD
  def createUser
    puts "Insira os dados do utilizador (username:password:name:balance):"
    return gets.chomp
  end

  def readUser(username, name, balance)
    puts "#:#:#:#:#:#:#:#:#:#:#:#:#:"
    puts "Username ::  #{username}"
    puts "Name :: #{name}"
    puts "Balance :: #{balance}"
  end

  def updateUser
    puts "Insira os dados do utilizador (username:password:name:balance):"
    return gets.chomp
  end

  def deleteUser(username, name, balance)
    puts "User removed. (#{username} - #{name} - #{balance})"
  end
end

