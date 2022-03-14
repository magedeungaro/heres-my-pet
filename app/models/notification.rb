class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphyc: true
end
