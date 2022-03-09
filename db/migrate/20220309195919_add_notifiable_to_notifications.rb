class AddNotifiableToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :notifiable, polymorphic: true, null: false, type: :uuid
  end
end
