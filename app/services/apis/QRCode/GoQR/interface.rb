class Apis::QRCode::GoQR::Interface
  def self.generate_qrcode(text:, square_height: 150)
    if text.to_s.empty?
      Sentry.capture_exception(ArgumentError.new("Text is required"))

      return
    end

    size = "#{square_height}x#{square_height}"
    Apis::QRCode::GoQR::Endpoints.create_qr_code(text: text.to_s, size: size)
  end
end
