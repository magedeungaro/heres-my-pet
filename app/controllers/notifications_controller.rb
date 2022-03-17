class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).where(user_id: current_user.id)
  end

  def show
    @notification = Notification.find(params[:id])
    "#{notf.notifiable_type}sController".constantize.send(:show)
  end
end
