module NotificationHelper
  def notification_title(notification)
    name = user_info(notification.actor)
    if notification.action == "answered"
      "#{name} #{notification.action} a question that you are following"
    else
      "#{name} #{notification.action} on a #{notification.notifiable_type.downcase} that you are following"
    end
  end

  def notification_question_title(notification)
    case notification.notifiable_type
    when "Question"
      notification.notifiable.title
    when "Answer"
      notification.notifiable.question.title
    end
  end
end
