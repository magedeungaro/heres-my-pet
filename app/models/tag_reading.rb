class TagReading < ApplicationRecord
  belongs_to :pet
  include Notifiable

  validates :message, presence: true, length: {minimum: 5}
  validates :user_consent, presence: true
end
