module ApplicationHelper
  def title(text, home: false)
    text += ' - Discuss Stirling' unless home
    content_for :title, text
  end

  def created_at_in_words(object)
    distance_of_time_in_words_to_now(object.created_at) + ' ago'
  end

  def user_info(user)
    user.private_account? ? "Private User" : user.name
  end
end
