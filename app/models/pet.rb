class Pet < ApplicationRecord
  belongs_to :user
  has_many :tag_readings, dependent: :destroy
  has_one_attached :photo
  has_one_attached :qr_code

  validates :name, presence: true
  validates :gender, presence: true
  validates :pet_type, presence: true

  def attach_qr(request_path)
    file = build_qr(request_path)
    FileService.attach_file(file: file, file_name: self.id, obj: self, attachable_type: 'qr_code')
  end

  private

  def build_qr(request_path)
    path_to_qr = "#{Global::Constants::HOST}#{request_path}"
    Apis::QRCode::GoQR::Interface.generate_qrcode(text: path_to_qr)
  end
end
