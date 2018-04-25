module Candidate
  class CadastreGeolocation < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastre_geolocations"

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :general, class_name: "Candidate::View::GeneralPontuation", foreign_key: :cadastre_id, primary_key: :id
    
    scope :cadastres_max, -> { 
      includes(:general)
      .includes(cadastre: [:program])
      .where('candidate_cadastre_geolocations.id = (SELECT MAX(extranet.candidate_cadastre_geolocations.id)
              FROM extranet.candidate_cadastre_geolocations
              WHERE candidate_cadastre_geolocations.cadastre_id = general_pontuations.id)')
      .order('extranet.general_pontuations.total DESC')
    }

    #- por tipo de dado [aplicativo, dados declarados]
    scope :by_type, -> (value) { where(geolocation_type: value)}
    
    #- por situação [aplicativo, dados declarados]
    scope :by_situation, -> (value) { where('extranet.general_pontuations.situation_status_id = ?', value)}
    
    #- por faixa de renda
    scope :by_income, -> (zone) { 
      values = self.get_zone_by(zone)
      where("extranet.general_pontuations.income between #{values[0]} and #{values[1]}")
    }
    
    #- por sexo
    scope :by_gender, -> (value) {where(gender: value)}

    #- por lista
    scope :by_list, -> (value) {

      case value
      when 'old'
        sql = "(extract(year from age(extranet.general_pontuations.born)) >= 60 or (select COUNT(*)
              from extranet.candidate_dependents
              where extract(year from age(born)) >= 60
              and cadastre_id = extranet.general_pontuations.id) > 0)"
        where(sql)

      when 'rii'
        where('extranet.general_pontuations.program_id = 1')
      when 'rie'
        where('extranet.general_pontuations.program_id = 2')
      when 'special'
        sql = "(extranet.general_pontuations.special_condition_id = 2 or (select COUNT(*)
               from extranet.candidate_dependents
               where extranet.candidate_dependents.special_condition_id = 2
               and extranet.candidate_dependents.cadastre_id = extranet.general_pontuations.id) > 0)"
        where(sql)

      when 'vulnerable'
        where('extranet.general_pontuations.program_id = 4')
      end

    }

    #- por quantidade dos melhores pontuados
    scope :by_pontuation_range, -> (value) { limit(value) }

    #- por cidade
    scope :by_city, -> (value) {where('extranet.candidate_cadastres.city_id = ?', value)}
    
    #- as 5 maiores concentrações do filtro
    
    #- por RA
    
    #- por atualização cadastral
    scope :by_update, -> (value) {
      if value == "true"
        where('extranet.candidate_cadastres.updated_at::date > ?', '2016-10-30')
      else
        all
      end
    }
    
    def self.get_zone_by zone 
      case zone.to_i 
      when 1
        [0, 1600]
      when 2
        [1600.01, 3275]
      when 3
        [3275.01, 5000]
      when 4
        [5000.01, 99999]
      end
    end

  end
end
