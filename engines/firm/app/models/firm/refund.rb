module Firm
  class Refund
    include ActiveModel::Model
    extend CarrierWave::Mount

    attr_accessor :cpf, :observation, :cadastre, :file_path, :unit_id

    validates :cpf, cpf: true, presence: true
    validates :observation, presence: true
    validates :file_path, presence: true

    validate  :cpf_valid?

    mount_uploader :file_path, Firm::FilePathUploader

    private

    def cpf_valid?
      @cadastre = ::Candidate::Cadastre.find_by_cpf(self.cpf) rescue nil
      @unit = ::Address::Unit.find(self.unit_id) rescue nil

      if @cadastre.nil?
        errors.add(:cpf, 'CPF não existe na base de dados')
        return false
      end

      if %w(1 2 4 5).include? @cadastre.program_id.to_s
        unless @cadastre.current_situation_id == 4 && @cadastre.current_procedural.procedural_status_id == 8
          errors.add(:observation, 'Situação do CPF não é válida para esta operação')

        end
      end

    end


  end
end
