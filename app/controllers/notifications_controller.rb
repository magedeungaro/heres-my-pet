class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).where(user_id: current_user.id)
  end

  def mark_as_read
    @notifications = policy_scope(Notification).where(user_id: current_user.id).unread
    @notification.update_all(viewed: true)
    render :index
  end

  def notifications_counter
    @notifications = policy_scope(Notification).where(user_id: current_user.id).unread.length
    respond_to do |format|
      format.json {
        render json: @notifications
      }
    end

  end

  def destroy
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.destroy

    redirect_to notifications_path
  end
end
