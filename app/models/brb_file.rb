class BrbFile

  def self.file_return
    dir = Dir.entries("#{Rails.root}/public/brb_file/RECEPÇÃO")
    
    json = []

    dir.each_with_index do |file, index|
      next if index < 2

      json << {
        'remessa': "#{file}",
        'arquivo': "http://www.codhab.df.gov.br/boletos/arquivo/#{file}"
      }
    end

    json
  rescue
    json = []
  end
end