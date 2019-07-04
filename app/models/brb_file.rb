class BrbFile

  def self.file_return
    dir = Dir.entries("#{Rails.root}/brb_file/RECEPÇÃO")
    dir.delete '.'
    dir.delete '..'
    dir = dir.sort_by { |item| self.parse_date(item) } 

    json = []

    dir.each_with_index do |file, index|
      next if index < 2

      json << {
        'remessa': "#{file}",
        'arquivo': "http://www.codhab.df.gov.br/boletos/arquivo/#{file}"
      }
    end
    
    json 
  rescue Exception => e
    p e
    json = []
  end

  def self.parse_date(item)
    Date.parse("#{item.scan(/\d+/)[1].to_s[4..7]}#{item.scan(/\d+/)[1].to_s[2..3]}#{item.scan(/\d+/)[1].to_s[0..1]}") rescue Date.parse('19000101')
  end
end