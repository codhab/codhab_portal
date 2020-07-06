module Regularization
  class ItapoaRegularization < ActiveRecord::Base
    self.table_name = 'offboardx.form_itapoa_regularizations'
    
    enum unit_characterist: { "vazio" => 1, "construído" => 2, "em_construção" => 3}

    enum unit_characterist_occupation: { "doado_pelo_GDF" => 1, "irregular" => 2, "alugado" => 3, "cedido" => 4, "comprado" => 5}

    enum unit_characterist_edification: { "alvenaria" => 1, "madeira" => 2, "madeirite" => 3, "outros" => 4}

    enum unit_characterist_room: { "de_01_a_03" => 1, "04_a_05" => 2, "mais de 05" => 3}
    
    enum unit_characterist_dweller: { "01_a_03" => 1, "04_a_07" => 2, "mais_de_07" => 3}
    
    enum unit_characterist_piped_water: { "CAESB" => 1, "água_gambiarra" => 2, "sem_água" => 3}
    
    enum unit_characterist_electricity: { "CEB" => 1, "energia_gambiarra" => 2, "sem_energia" => 3}

    validates :cpf, cpf: true, uniqueness: true, presence: true
    validates :iptu_code, presence: true

    validates :name, :rg, :naturality, :civil_state_id, :born, :income, :phone, presence: true
    validates :email, email: true, presence: true

    validates :declaration_negative, 
              :declaration_descriptive,
              :declaration_pacific,
              :terms_use,
              presence: true

    validate :validate_iptu 

    private

    def validate_iptu
      unit = Address::Unit.find_by(iptu_registration: self.iptu_code)

      if unit.nil?
        errors.add(:unit, 'não encontrado; verifique ou pesquise abaixo o número correto')
      else
        self.unit_id = unit.id
        self.complete_address = unit.complete_address
      end
    end

  end
end