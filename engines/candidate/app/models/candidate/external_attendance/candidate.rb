module Candidate
  module ExternalAttendance
    class Candidate < ActiveRecord::Base
      self.table_name = 'extranet.todos_pre_habilitados'

      has_many :enterprise_cadastres, class_name: "::Firm::EnterpriseCadastre", foreign_key: :cadastre_id, primary_key: :cadastre_id
      has_many :tickets, class_name: "::Candidate::ExternalAttendance::Ticket", foreign_key: :cadastre_id, primary_key: :cadastre_id
      
      scope :by_cpf, -> (cpf) {
        where(cpf: cpf.to_s.unformat_cpf)
      }

      scope :by_indication, -> (value) {
        if value == 'true'
          joins('INNER JOIN extranet.candidate_enterprise_cadastres
            ON extranet.candidate_enterprise_cadastres.cadastre_id = extranet.todos_pre_habilitados.cadastre_id
            AND extranet.candidate_enterprise_cadastres.indication_type_id = 999')       
        else
          joins('LEFT JOIN extranet.candidate_enterprise_cadastres 
            ON extranet.candidate_enterprise_cadastres.cadastre_id = extranet.todos_pre_habilitados.cadastre_id')
          .where('extranet.candidate_enterprise_cadastres.id is null')  
        end
      }

      scope :by_occurrence, -> (value) {
        if value == 'true'
          joins('INNER JOIN extranet.candidate_cadastre_occurrences
            ON extranet.candidate_cadastre_occurrences.cadastre_id = extranet.todos_pre_habilitados.cadastre_id
            AND extranet.candidate_cadastre_occurrences.solved is false')       
        else
          joins('LEFT JOIN extranet.candidate_cadastre_occurrences 
            ON extranet.candidate_cadastre_occurrences.cadastre_id = extranet.todos_pre_habilitados.cadastre_id
            AND extranet.candidate_cadastre_occurrences.solved is false')       
          .where('extranet.candidate_cadastre_occurrences.id is null')  
        end        
      }

      def cadastre
        ::Candidate::Cadastre.find_by(cpf: self.cpf)
      end

      def ticket
        ::Candidate::ExternalAttendance::Ticket.find_by(cadastre_id: self.cadastre_id)
      end

      def occurrences
        ::Candidate::CadastreOccurrence.where(cadastre_id: self.cadastre_id, solved: false)
      end
      
      def ticket_requests
        if ticket.request
          ::Candidate::ExternalAttendance::TicketRequest.where(custom_ticket_id: ticket.id, closed: false)
        else 
          nil 
        end
      end
      
    end
  end
end