module Subject

  @observers

  def initialize
    @observers = []
  end

  def getObservers
    @observers
  end

  def registerObserver(observer)
    @observers << observer
  end

  def removeObserver(observer)
    @observers.delete(observer)
  end

  #TODO talvez faça sentido criar um notifyUser e notifyBookie - ja se discute isso
  def notifyObservers(gameId, type, result, updateString)
    @observers.each do |observer|
      observer.update(gameId, type, result, updateString)
    end
  end

end