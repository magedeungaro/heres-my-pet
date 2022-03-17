class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).where(user_id: current_user.id)
  end
end
