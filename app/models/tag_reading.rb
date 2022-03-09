class TagReading < ApplicationRecord
  belongs_to :pet
  include Notifiable
end
