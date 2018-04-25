module Firm
  class SellingService

    def initialize(cadastre, unit, user_company)
      @cadastre        = cadastre
      @unit            = unit
      @user_company    = user_company
    end


    def sell! (selling_observation, selling_file_path)
      return false unless @unit.unit_book?

      #realiza a criação de um novo registro em unit
      cadastre_address = @unit.cadastre_address.new({
        cadastre_id: @cadastre.id,
        observation: selling_observation,
        situation_id: 1, #distribuido,
        type_receipt: 0 #SEGETH/CODHAB
      }).save

      #imovel_reservado
      @unit.update(situation_unit_id: 3) #distribuitdo

      issuance(@cadastre.current_procedural, selling_observation)
      create_log(selling_observation, selling_file_path, 11)
    end

    def delivery!
      return false unless @unit.unit_book?

      update_cadastre(@cadastre.current_procedural, selling_observation)
      create_log(selling_observation, selling_file_path, 17)
    end

    private

    def issuance current_procedural, selling_observation

      @cadastre.cadastre_procedurals.new({
        procedural_status_id: 42,  #contrato assinado
        convocation_id: current_procedural.convocation_id,
        assessment_id: current_procedural.assessment_id,
        observation: selling_observation
      }).save

    end

    def update_cadastre current_procedural, selling_observation

      @cadastre.cadastre_procedurals.new({
        procedural_status_id: 4,  #imovel distribuido
        convocation_id: current_procedural.convocation_id,
        assessment_id: current_procedural.assessment_id,
        observation: selling_observation
      }).save

      @cadastre.cadastre_situations.new({
        situation_status_id: 7
      }).save
    end


    def create_log (selling_observation, selling_file_path, situation)
        @enterprise_cadastre = Firm::EnterpriseCadastre.where('cadastre_id = ? and enterprise_id = ? and inactive is not true',@cadastre.id, @unit.enterprise_typology.enterprise_id).first
      @cadastre.cadastre_activities.new({
        activity_status_id: 13, #contemplação de imóvel
        type_activity: 2, #simples
        observation: selling_observation
      }).save

      Firm::EnterpriseCadastreSituation.new({
        enterprise_cadastre_status_id: situation, #VENDA de imóvel
        file_path: selling_file_path,
        observation: selling_observation,
        firm_user_id: @user_company.id,
        enterprise_cadastre_id: @enterprise_cadastre.id,
        success: true
      }).save

    end

  end
end
