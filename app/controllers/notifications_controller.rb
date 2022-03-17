class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).where(user_id: current_user.id)
  end

  def destroy
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.destroy

    redirect_to notifications_path
  end
end
