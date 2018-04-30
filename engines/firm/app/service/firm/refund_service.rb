module Firm
  class RefundService # :nodoc:

    def initialize(cadastre, unit, user_company)
      @cadastre        = cadastre
      @unit            = unit
      @user_company    = user_company
    end


    def refund!(refund_observation, refund_file_path)
      return false unless @unit.unit_book?

      #realiza a criação de um novo registro em unit
      cadastre_address = @unit.cadastre_address.new(
        cadastre_id: @cadastre.id,
        observation: refund_observation,
        situation_id: 2,
        user_company_id: @user_company.id
      ).save

      #imovel_reservado
      @unit.update(situation_unit_id: 1)

      update_cadastre(@cadastre.current_procedural, refund_observation)
      create_log(refund_observation, refund_file_path)
    end

    private

    def update_cadastre current_procedural, refund_observation

      @cadastre.cadastre_procedurals.new(
        procedural_status_id: 14,  #em ordem com endereço
        convocation_id: current_procedural.convocation_id,
        assessment_id: current_procedural.assessment_id,
        transfer_assessment_id: current_procedural.transfer_assessment_id,
        observation: refund_observation
      ).save

    end


    def create_log (refund_observation, refund_file_path)
      @enterprise_cadastre = Firm::EnterpriseCadastre.where('cadastre_id = ? and enterprise_id = ? and inactive is not true',@cadastre.id, @unit.enterprise_typology.enterprise_id).first

      @cadastre.cadastre_activities.new({
        activity_status_id: 22, #reserva de imóvel
        type_activity: 0, #simples
        observation: refund_observation
      }).save


      Firm::EnterpriseCadastreSituation.new(
        enterprise_cadastre_status_id: 14, #reserva de imóvel
        file_path: refund_file_path, #simples
        observation: refund_observation,
        firm_user_id: @user_company.id,
        enterprise_cadastre_id: @enterprise_cadastre.id,
        success: true
      ).save

    end

  end
end
