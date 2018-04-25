module Firm
  class Booking
    include ActiveModel::Model
    extend CarrierWave::Mount

    attr_accessor :cpf, :observation, :cadastre, :file_path, :unit_id

    validates :cpf, cpf: true, presence: true
    validates :observation, presence: true


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

      if %w(1 2 4 5).include?(@cadastre.program_id.to_s)
        if !@cadastre.current_procedural.present? || (@cadastre.current_situation_id != 4 && !%w(14 72).include?(@cadastre.current_procedural.procedural_status_id.to_s))
          errors.add(:cpf, 'Situação do CPF não é válida para esta operação')
        end

        if @unit.current_cadastre_address.present? && %w(0 1 5).include?(@unit.current_cadastre_address.situation_id.to_s)
          if @unit.current_cadastre_address.cadastre_id == @cadastre.id

           errors.add(:cpf, 'CPF já possui vinculo com imóvel.')
          end
        end

        if @cadastre.enterprise_cadastres.where('inactive is not true').present?
          
          begin
            unless @cadastre.enterprise_cadastres.where('inactive is not true and enterprise_id = ?',   @unit.enterprise_typology.enterprise_id).present?
              errors.add(:cpf, 'CPF não possui indicação para este empreendimento.')
            end
          rescue
            errors.add(:cpf, 'CPF não possui indicação para este empreendimento.')
          end
        else
          errors.add(:cpf, 'CPF não possui indicação para empreendimento.')
        end
      end

    end

  end
end
