require 'rqrcode_png'

class PrintingQrcodeService
  
  def self.generate! code
    #RQRCode::QRCode.new(code.to_s).to_img.resize(100, 100).to_data_url
  
    require 'barby'
    require 'barby/barcode'
    require 'barby/barcode/qr_code'
    require 'barby/outputter/png_outputter'
  
    barcode = Barby::QrCode.new(code.to_s, level: :q, size: 9)
    base64_output = Base64.encode64(barcode.to_png({ xdim: 2 }))
    "data:image/png;base64,#{base64_output}"
  end

end
