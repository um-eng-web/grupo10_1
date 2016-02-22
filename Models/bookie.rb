class Bookie

  #instance variables
  @bookieName
  @password
  @createdGames
  @followingGames
  @notifications


  #initialize
  def initialize(name, pass)
    @bookieName = name
    @password = pass
    @createdGames = Hash.new
    @followingGames = Hash.new
    @notifications = Array.new
  end


  #accessors
  def getBookieName
    @bookieName
  end

  def getPassword
    @password
  end

  def getCreatedGames
    @createdGames
  end

  def getFollowingGames
    @followingGames
  end

  def getNotifications
    @notifications
  end


  #setters
  def setBookiName=(name)
    @bookieName = name
  end

  def setPassword=(pass)
    @password = pass
  end

  def setCreatedGames=(cGames)
    @createdGames = cGames
  end

  def setFollowingGames=(fGames)
    @followingGames = fGames
  end

  def setNotifications=(notify)
    @notifications = notify
  end

end
