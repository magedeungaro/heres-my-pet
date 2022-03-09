class Pet < ApplicationRecord
  belongs_to :user
  has_many :tag_readings

  validates :name, presence: true
  validates :gender, presence: true
  validates :pet_type, presence: true
  validates :spayed, presence: true
  validates :lost, presence: true
end
