
class Notification
  @notificationId
  @type
  @body
  @readed

  def initialize
    @notificationId = nil
    @type = nil
    @body = nil
    @readed = false
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
end