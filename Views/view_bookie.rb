class ViewBookie

  def createBookie
    puts "Create new bookie: (bookieName:password)"
    return gets.chomp
  end

  def readBookie(bookie, logged,  createdNumber, followedNumber)
    puts "BookieName: #{bookie}"
    puts "Logged: #{logged}"
    puts "Number of Created Games: #{createdNumber}"
    puts "Number of Followed Games: #{followedNumber}"
  end

  def updateBookie
    puts "Update bookie: (bookieName:password)"
    return gets.chomp
  end

  def deleteBookie(bookiename)
    puts "Delete bookie. #{bookiename}"
  end

end