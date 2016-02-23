class ViewGame

  def createGame
    puts "Create new game: (team1:team2:time)"
    return gets.chomp
  end

  def readGame(id, creator, team1, team2, result, actualOdd, time)
    puts "Game id: #{id}"
    puts "Game creator: #{creator}"
    puts "Home: #{team1}"
    puts "Visitor: #{team2}"
    puts "Result: #{result}"
    puts "Actual Odd: #{actualOdd}"
    puts "Hour of Game: #{time}"
  end

  def updateGame
    puts "Create new game: (team1:team2:result:)"
    var = gets.chomp
    return var
  end

  def deleteGame(id, creator, team1, team2, result)
    puts "Game Deleted. (#{id}-#{creator}-#{team1}-#{team2}-#{result})"
  end

end