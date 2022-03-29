class Pet < ApplicationRecord
  before_destroy :destroy_attachments

  belongs_to :user
  has_many :tag_readings, dependent: :destroy
  has_one_attached :photo
  has_one_attached :qr_code

  scope :without_qr, -> do
    Pet.left_joins(:qr_code_attachment).where(active_storage_attachments: { id: nil })
  end


  validates :name, presence: true
  validates :gender, presence: true
  validates :pet_type, presence: true

  def attach_qr(request_path)
    file = build_qr(request_path)
    FileService.attach_file(file: file, file_name: self.id, obj: self, attachable_type: 'qr_code')
  end

  private

  def build_qr(request_path)
    path_to_qr = "#{Global::Constants::HOST}#{request_path}?qrcode=true"
    Apis::QRCode::GoQR::Interface.generate_qrcode(text: path_to_qr)
  end

  def destroy_attachments
    ['qr_code', 'photo'].each { |attachment_type| FileService.purge_attachment(attachable_type: attachment_type, obj: self)}
  end
end
