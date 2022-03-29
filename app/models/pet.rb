class Pet < ApplicationRecord
  belongs_to :user
  has_many :tag_readings, dependent: :destroy
  has_one_attached :photo
  has_one_attached :qr_code

  validates :name, presence: true
  validates :gender, presence: true
  validates :pet_type, presence: true
end
