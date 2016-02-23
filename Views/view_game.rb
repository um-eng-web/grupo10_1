class ViewGame

  #CRUD views
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
    puts "Create new game: (id:creator:team1:team2:result)"
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

end