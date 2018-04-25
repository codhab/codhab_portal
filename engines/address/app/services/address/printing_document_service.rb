module Address
  class PrintingDocumentService

    def initialize(cadastre)
      @cadastre = cadastre
    end

    def positive_certificate!

      return false if (@cadastre.current_situation_id != 7 || ![3,6].include?(@cadastre.program_id))
      unit = @cadastre.current_cadastre_address.unit rescue nil

      return false if unit.nil?
      (unit.situation_unit_id == 3 && unit.current_registry_id != 3)

    end

    def positive_certificate_log!

      return false unless @cadastre.current_cadastre_address.present?

      Candidate::CadastreActivity.new({
        cadastre_id: @cadastre.id,
        activity_status_id: 15, #impressão de certidão positiva
        type_activity:  0, #atividade simples
        observation: "Ficha descritiva impressa pelo site"
      }).save

    end

  end
end
