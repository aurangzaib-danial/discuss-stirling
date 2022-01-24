module NotificationHelper
  def notification_title(notification)
    name = "<strong>#{user_info(notification.actor)}</strong>"
    action = notification_action(notification)
    if action == "answered"
      title = "#{name} #{action} a question that you are following"
    else
      title = "#{name} #{action} on #{notifiable_type_with_article(notification)} that you are following"
    end
    title.html_safe
  end

  def notification_question(notification)
    case notification.notifiable_type
    when "Question"
      notification.notifiable
    when "Answer"
      notification.notifiable.question
    end
  end

  def notification_link(notification)
    slug_path(notification_question(notification), anchor: dom_id(notification.actionable))
  end

  def notification_action(notification)
    notification.actionable_type == "Answer" ? "answered" : "commented"
  end

  def notifiable_type_with_article(notification)
    type = notification.notifiable_type.downcase
    type == "answer" ? "an answer" : "a #{type}"
  end
end
