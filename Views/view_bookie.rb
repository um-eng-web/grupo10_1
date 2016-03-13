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

  def loggedOut
    puts "Logout successfully done"
  end

  def changePassword
    puts "Insert Old Password: (oldPassword)"
    old = gets.chomp
    puts "Insert New Password: (newPassword)"
    new = gets.chomp
    puts "Confirm New Password: (confirmPassword)"
    confirm = gets.chomp
    return old, new, confirm
  end

  def throwNewPasswordException
    puts "ERROR: Incorrect Password."
  end

end