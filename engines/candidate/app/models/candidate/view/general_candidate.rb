module Candidate
  module View
    class GeneralCandidate < ActiveRecord::Base 
      self.table_name = 'extranet.general_candidates'
            
      belongs_to :cadastre,         class_name: ::Core::Candidate::Cadastre
      belongs_to :dependent,        class_name: ::Core::Candidate::Dependent, foreign_key: :cadastre_id
      belongs_to :situation_status, class_name: ::Core::Candidate::SituationStatus

      scope :by_income, -> (started_at = 0, ended_at = 1600) { where(income: started_at..ended_at) }
      scope :by_cpf, -> (cpf) {

        current = find_by(cpf: cpf.to_s.unformat_cpf) rescue nil

        if current.nil?
          all
        else
          where(total: (current.total - 0.400)..(current.total + 0.400))
        end
      }
      scope :by_name, -> (name) {

        name = name.strip!
        where("name ILIKE '%#{name}%' ")

      }

      def cadastre
        Core::Candidate::Cadastre.find(self.id) rescue nil
      end
    end
  end
end