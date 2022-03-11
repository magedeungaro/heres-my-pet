module QrcodeHelper
  def qr_code_url(request_path)
    "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://www.heresmy.pet#{request_path}?qrcode=true"
  end
end
