class CplConcurrence::DocumentUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    'uploads/cpl_concurrence/files'
  end

  def extension_white_list
    %w(xls xlsx pdf zip doc docx)
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

end
