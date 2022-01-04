module ApplicationHelper
  def title(text, home: false)
    text += ' - Discuss Stirling' unless home
    content_for :title, text
  end
end
