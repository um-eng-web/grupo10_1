class ViewBet

  def createBet
    puts "Insert your bet(1 or X or 2) and amount: (type:amount)"
    return gets.chomp
  end

  #TODO passar o game como string e nao a classe
  def readBet(betId, gameId, game, type, betAmount, state, result)
    puts "BetId: #{betId}"
    puts "GameId: #{gameId}"
    puts "Game: #{game.readGame}"
    puts "Type: #{type}"
    puts "Bet Amount: #{betAmount}"
    puts "Bet State: #{state}"
    puts "Bet Result: #{result}"
  end


end