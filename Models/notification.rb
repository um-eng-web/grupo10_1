
class Notification
  @notificationId
  @type
  @body
  @readed

  def initialize(id, type, body, readed)
    @notificationId = id
    @type = type
    @body = body
    @readed = readed
  end

  def getNotificationId
    @notificationId
  end

  def getType
    @type
  end

  def getBody
    @body
  end

  def getReaded
    @readed
  end

  def setNotificationId=(id)
    @notificationId = id
  end

  def setType=(type)
    @type = type
  end

  def setBody=(body)
    @body = body
  end

  def setReaded=(bool)
    @readed = bool
  end

  def to_s
    puts "\nNotification:"
    puts "ID: #{@notificationId}"
    puts "Type: #{@type}"
    puts "Body: #{@body}"
    puts "Readed: #{@readed}"
  end


end