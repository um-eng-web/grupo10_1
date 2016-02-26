require_relative '../Controllers/controller_game'

class Bookie

  #instance variables
  @bookieName
  @password
  @logged
  @createdGames
  @followingGames


  #initialize
  def initialize
    @bookieName = nil
    @password = nil
    @logged = false
    @createdGames = Hash.new
    @createdGames.default = ControllerGame
    @followingGames = Hash.new
    @followingGames.default = ControllerGame
  end


  #accessors
  def getBookieName
    @bookieName
  end

  def getPassword
    @password
  end

  def getLogged
    @logged
  end

  def getCreatedGames
    @createdGames
  end

  def getFollowingGames
    @followingGames
  end


  #setters
  def setBookieName=(name)
    @bookieName = name
  end

  def setPassword=(pass)
    @password = pass
  end

  def setLogged=(log)
    @logged = log
  end

  def setCreatedGames=(cGames)
    @createdGames = cGames
  end

  def setFollowingGames=(fGames)
    @followingGames = fGames
  end


  def insertCreatedGame(gameId, game)
    @createdGames[gameId] = game
    @followingGames[gameId] = game
  end

  #TODO fazer as condiçoes de verificaçao
  def insertFollowingGame(gameId, game)
    @followingGames[gameId] = game
  end




end
