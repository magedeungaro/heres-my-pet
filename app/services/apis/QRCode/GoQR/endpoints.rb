class Apis::QRCode::GoQR::Endpoints
  def self.create_qr_code(text:, size:)
    url = "api.qrserver.com/v1/create-qr-code/?size=#{size}&data=#{text}"
    ApiCallerService.fetch(url: url)
  end
end
