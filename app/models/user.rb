class User < ApplicationRecord
  before_destroy :destroy_attachments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :nickname, uniqueness: true, allow_blank: true

  private

  def destroy_attachments
    ['photo'].each { |attachment_type| FileService.purge_attachment(attachable_type: attachment_type, obj: self)}
  end
end
