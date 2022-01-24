class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html do
        @notifications = current_user.notifications.ordered_by_latest
      end

      format.turbo_stream do
        @notifications = current_user.notifications.recent
      end
    end
  end

  def mark_as_read
    current_user.notifications.unread.update_all(read_at: Time.zone.now)
  end
end