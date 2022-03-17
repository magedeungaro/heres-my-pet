class AddUserRefToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :user, null: false, foreign_key: true, type: :uuid
  end
end
