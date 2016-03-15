class ViewGame

  #CRUD views
  def createGame
    puts "Create new game: (team1:team2:time)"
    return gets.chomp
  end

  def readGame(id, creator, team1, team2, result, actualOdd, time, closedToBet, finished)
    puts "\nGame id: #{id}"
    puts "Game creator: #{creator}"
    puts "Home: #{team1}"
    puts "Visitor: #{team2}"
    puts "Result: #{result}"
    puts "Actual Odd: #{actualOdd}"
    puts "Hour of Game: #{time}"
    puts "Closed To Bet?: #{closedToBet}"
    puts "Finished?: #{finished}"
  end


  def updateGameFinished
    puts "Update game: (result)"
    return gets.chomp
  end

  def deleteGame(id, creator, team1, team2, result, actualOdd)
    puts "Game Deleted. (#{id}-#{creator}-#{team1}-#{team2}-#{result}-#{actualOdd})"
  end


  #show odds with array index
  def printOddArray(array)
    puts "Odd - Index:"
    array.each_with_index {|val, index| puts "#{val} - #{index}"}
    puts "\nSelect the odd index you want to remove:"
    return gets.chomp.to_i
  end

  def printOdds (array)
    puts "Odd - Index:"
    array.each_with_index {|val, index| puts "#{val} - #{index}"}
  end

  def successGameClosedToBet
    puts"Game Closed to Bet Successfuly"
  end

  def successGameEndedToBet
    puts"Game Ended Successfuly"
  end

  def gameToCloseAlreadyExists
    puts"The Game you want to close, is already closed!"
  end

  def gameToEndAlreadyExists
    puts"The Game you want to end, is already ended!"
  end

  def printObservers(array)
    puts "Observer"
    array.each {|val| puts "#{val.to_s}"}
  end


end