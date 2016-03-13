class ViewOdd

  def createOdd
    puts "Create new odd: (odd1:oddX:odd2)"
    return gets.chomp
  end

  def readOdd(bookie, odd1, oddx, odd2, time)
    puts "Creator: #{bookie}"
    puts "Odd1: #{odd1}"
    puts "OddX: #{oddx}"
    puts "Odd2: #{odd2}"
    puts "Timestamp: #{time}"
  end

  def updateOdd
    puts "Create new odd: (odd1:oddX:odd2)"
    return gets.chomp
  end

  def deleteOdd(bookie, odd1, oddx, odd2)
    puts "Odd deleted. (#{bookie}-#{odd1}-#{oddx}-#{odd2})"
  end

end