class Apis::QRCode::GoQR::Endpoints
  def create_qr_code(text:, size:)
    url = " https://api.qrserver.com/v1/create-qr-code/?size=#{size}&data=#{text}"
    ApiCallerService.fetch(url: url)
  end
end
