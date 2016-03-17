class ViewNotification

  def readNotification(notificationId, type, body, readed)
    puts "\nNotification:"
    puts "ID: #{notificationId}"
    puts "Type: #{type}"
    puts "Body: #{body}"
    puts "Readed: #{readed}\n"
  end

end