module Firm
  class RescissingService

    def initialize(cadastre, unit, staff)
      @cadastre = cadastre
      @unit     = unit
      @staff    = staff
    end


    def rescission! booking_observation
      return false unless @unit.unit_block?

      #realiza a criação de um novo registro em unit
      cadastre_address = @unit.cadastre_address.new({
        cadastre_id: @cadastre.id,
        observation: booking_observation,
        situation_id: 2 #distrato
      }).save

      #imovel_reservado
      @unit.update(situation_unit_id: 1) #vago

      update_cadastre(@cadastre.current_procedural, booking_observation)
      create_log(booking_observation)
    end

    private

    def update_cadastre current_procedural, booking_observation

      @cadastre.cadastre_procedurals.new({
        procedural_status_id: 14,  #em ordem com endereço
        convocation_id: current_procedural.convocation,
        assessment_id: current_procedural.assessment_id,
        transfer_assessment_id: current_procedural.transfer_assessment_id,
        staff_id: @staff.id,
        observation: booking_observation
      }).save

      @cadastre.cadastre_situations.new({
        situation_status_id: 4
      }).save

    end


    def create_log booking_observation
      @cadastre.cadastre_activities.new({
        staff_id: @staff.id,
        activity_status_id: 14, #dessvinculação de imóvel
        type_activity: 2, #critico
        observation: booking_observation
      }).save
    end

  end
end
