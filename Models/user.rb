class User

  #instance variables
  @username
  @password
  @name
  @balance
  @logged
  @openBets
  @betsHistory
  @followingGames
  @gamesHistory

  #initialize method
  def initialize
    @username = nil
    @password = nil
    @name = nil
    @balance = nil
    @logged = false
    @openBets = Hash.new
    @betsHistory = Hash.new
    @followingGames = Hash.new
    @gamesHistory = Hash.new
  end

  #accessor's methods (getters)
  def getUsername
    @username
  end

  def getPassword
    @password
  end

  def getName
    @name
  end

  def getBalance
    @balance
  end

  def getLogged
    @logged
  end

  def getOpenBets
    @openBets
  end

  def getBetsHistory
    @betsHistory
  end

  def getFollowingGames
    @followingGames
  end

  def getGamesHistory
    @gamesHistory
  end

  #setters
  def setUsername=(user)
    @username = user
  end

  def setPassword=(pass)
    @password = pass
  end

  def setName=(name)
    @name = name
  end

  def setBalance=(bal)
    @balance = bal
  end

  def setLogged=(log)
    @logged = log
  end

  def setOpenBets=(oBets)
    @openBets = oBets
  end

  def setBetsHistory=(bHistory)
    @betsHistory = bHistory
  end

  def setFollowingGames=(fGames)
    @followingGames = fGames
  end

  def setGamesHistory=(gHistory)
    @gamesHistory = gHistory
  end

end
