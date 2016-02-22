class Bookie

  #instance variables
  @bookiename
  @password
  @createdGames
  @followingGames
  @notifications


  #initialize
  def initialize(name, pass)
    @bookiename = name
    @password = pass
    @createdGames = Hash.new
    @followingGames = Hash.new
    @notifications = Array.new
  end


  #accessors
  def printBookiename
    @bookiename
  end

  def printPassword
    @password
  end

  def printCreatedGames
    @createdGames
  end

  def printFollowingGames
    @followingGames
  end

  def printNotifications
    @notifications
  end


  #setters
  def setBookiname(name)
    @bookiename = name
  end

  def setPassword(pass)
    @password = pass
  end

  def setCreatedGames(cGames)
    @createdGames = cGames
  end

  def setFollowingGames(fGames)
    @followingGames = fGames
  end

  def setNotifications(notify)
    @notifications = notify
  end


  #toString method
  def to_s
    puts "Bookiename ::  #{@bookiename}"
    puts "Password :: #{@password}"
    puts "Created Games :: #{@createdGames}"
    puts "Following Games :: #{@followingGames}"
    puts "Notifications :: #{@notifications}"
  end
end
