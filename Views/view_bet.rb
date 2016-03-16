class ViewBet

  def createBet
    puts "Insert your bet(1 or X or 2) and amount: (type:amount)"
    return gets.chomp
  end


  def readBet(betId, gameId, game, type, betAmount, state, result)
    puts "BetId: #{betId}"
    puts "GameId: #{gameId}"
    puts "Game: #{game.readGame}"
    puts "Type: #{type}"
    puts "Bet Amount: #{betAmount}"
    puts "Bet State: #{state}"
    puts "Bet Result: #{result}"
  end

  def updateBet
    puts "Insert your bet(1 or X or 2) and amount: (type:amount)"
    return gets.chomp
  end

  def deleteBet(betId, gameId, type, betAmount, odd, result)
    puts "Bet Deleted: #{betId}-#{gameId}-#{type}-#{betAmount}-#{odd}-#{result}"
  end


  def throwNotEnoughFunds
    puts "ERROR: Not Enough Funds!"
  end


end