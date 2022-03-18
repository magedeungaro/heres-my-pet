class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :user

  scope :unread, ->{ where(viewed: false)}
end
