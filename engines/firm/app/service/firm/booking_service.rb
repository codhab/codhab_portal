module Firm
  class BookingService

    def initialize(cadastre, unit, user_company)
      @cadastre        = cadastre
      @unit            = unit
      @user_company    = user_company
    end

    def book!(booking_observation, booking_file_path)
      return false unless @unit.unit_void?

      #realiza a criação de um novo registro em unit
      cadastre_address = @unit.cadastre_address.new(
        cadastre_id: @cadastre.id,
        observation: booking_observation,
        situation_id: 0,
        user_company_id: nil
      ).save

      #imovel_reservado
      @unit.update(situation_unit_id: 6)

      update_cadastre(@cadastre.current_procedural, booking_observation) if @cadastre.current_procedural.present?

      create_log(booking_observation, booking_file_path)
    end

    private

    def update_cadastre current_procedural, booking_observation
      @cadastre.cadastre_procedurals.new({
        procedural_status_id: 8,  #em ordem com endereço
        convocation_id: current_procedural.convocation_id.present? ? current_procedural.convocation_id : nil,
        assessment_id: current_procedural.assessment_id,
        transfer_assessment_id: current_procedural.transfer_assessment_id,
        observation: booking_observation
      }).save
    end

    def create_log (booking_observation, booking_file_path)
      @enterprise_cadastre = Firm::EnterpriseCadastre.where('cadastre_id = ? and enterprise_id = ? and inactive is not true',@cadastre.id, @unit.enterprise_typology.enterprise_id).first

      @cadastre.cadastre_activities.new({
        activity_status_id: 16, #reserva de imóvel
        type_activity: 0, #simples
        observation: booking_observation
      }).save

      Firm::EnterpriseCadastreSituation.new({
        enterprise_cadastre_status_id: 10, #reserva de imóvel
        file_path: booking_file_path, #simples
        observation: booking_observation,
        firm_user_id: nil,
        enterprise_cadastre_id: @enterprise_cadastre.id,
        success: true
      }).save
    end
  end
end
