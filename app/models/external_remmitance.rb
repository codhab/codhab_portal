require 'fileutils'

class ExternalRemmitance
  include ActiveModel::Model
  attr_accessor :document

  validates :document, presence: true

  def store!
    return false if !valid?

    timestamp = DateTime.now.to_i
    File.open("#{Rails.root}/tmp/remmessa_#{timestamp}.txt", "wb") do |file|
      file.write(Base64.decode64(document))
    end
    FileUtils.cp_r "#{Rails.root}/tmp/remmessa_#{timestamp}.txt", "/mnt/brb/ENVIO/remmessa_#{timestamp}.txt"
  rescue StandardError => e
    errors.add(:document, "Não foi possível salvar o arquivo. (#{e})")

    false
  end
end
