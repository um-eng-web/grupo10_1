require_relative '../Models/notification'
require_relative '../Views/view_notification'

class ControllerNotification

  @notificationModel
  @notificationView

  def initialize
    @notificationModel = Notification.new
    @notificationView = ViewNotification.new
  end

  def getNotificationModel
    @notificationModel
  end

  def getNotificationView
    @notificationView
  end

  def setNotificationModel=(model)
    @notificationModel = model
  end

  def setNotificationView=(view)
    @notificationView = view
  end


  def createNotification(id, type, body, readed)
    @notificationModel.setNotificationId = id
    @notificationModel.setType = type
    @notificationModel.setBody = body
    @notificationModel.setReaded = readed
  end

  def readNotification
    @notificationView.readNotification(@notificationModel.getNotificationId, @notificationModel.getType,
                @notificationModel.getBody, @notificationModel.getReaded)
  end

  def getReadedBool
    return @notificationModel.getReaded
  end

  def setReaded=(boolean)
    @notificationModel.setReaded = boolean
  end

end