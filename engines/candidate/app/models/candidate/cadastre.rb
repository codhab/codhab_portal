module Candidate
  class Cadastre < ActiveRecord::Base
    self.table_name = "extranet.candidate_cadastres"

    attr_accessor :password_confirmation

    has_many :tickets
    has_many :questions
    has_many :positions

    belongs_to :special_condition, class_name: "Candidate::SpecialCondition"
    belongs_to :program, class_name: "Candidate::Program"
    belongs_to :city, class_name: 'Address::City'
    belongs_to :civil_state, class_name: "Candidate::CivilState"

    has_many :askings, class_name: "Candidate::Asking"
    has_many :dependents, class_name: "Candidate::Dependent"
    has_many :cadastre_activities, class_name: "Candidate::CadastreActivity"
    has_many :cadastre_procedurals, class_name: "Candidate::CadastreProcedural"
    has_many :cadastre_situations, class_name: "Candidate::CadastreSituation"
    has_many :cadastre_observations, class_name: "Candidate::CadastreObservation"
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"
    has_many :enterprise_cadastres, foreign_key: "cadastre_id", class_name: "Firm::EnterpriseCadastre"
    has_many :pontuations, ->  { order(:id)}, class_name: "Candidate::Pontuation"
    has_many :agenda_schedules, class_name: "Schedule::AgendaSchedule", foreign_key: :cpf, primary_key: :cpf
    has_many :inheritors, class_name: "Candidate::Inheritor"


    #portas abertas

    def removed?
      self.cadastre_situations.where(observation: ['remoção quadra 105', 'remoção nova jerusalém'])
    end

    def manifestation_present?
      self.enterprise_cadastres.where(inactive: [false, nil], indication_situation_id: 2).present?
    end

    def indication_present?
      self.enterprise_cadastres.where(inactive: [false, nil], indication_situation_id: 1).present?
    end

    def manifestation_enterprise_present? enterprise_id
      self.enterprise_cadastres.where(enterprise_id: enterprise_id, indication_situation_id: [2], inactive: false).present?
    end


    def current_cadastre_address
     self.cadastre_address.order('created_at ASC').last rescue nil
    end

    def current_situation_id
      cadastre_situations.order('created_at ASC').last.situation_status_id rescue I18n.t(:no_information)
    end

    def current_procedural
     self.cadastre_procedurals.last rescue I18n.t(:no_information)
    end

    def current_procedural_name
     self.cadastre_procedurals.last.procedural_status.name rescue I18n.t(:no_information)
    end

    def current_situation_name
      cadastre_situations.order('id ASC').last.situation_status.name rescue I18n.t(:no_information)
    end

    def spouse
      self.dependents.where(kinship_id: 6).first rescue nil
    end

    def spouse_name
      self.dependents.where(kinship_id: 6).first.name rescue nil
    end

    def spouse_cpf
      self.dependents.where(kinship_id: 6).first.cpf rescue nil
    end

    def spouse_born
      self.dependents.where(kinship_id: 6).first.born.strftime('%d/%m/%Y') rescue nil
    end

    def self.olders
      where("(extract(year from age(born)) >= 60 or (select COUNT(*)
                       from extranet.candidate_dependents
                       where extract(year from age(born)) >= 60
                       and cadastre_id = extranet.candidate_cadastres.id) > 0)")
    end
  end
end
