class Pet < ApplicationRecord
  belongs_to :user
  has_many :tag_readings
end
