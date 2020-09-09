module Firm
  class EnterprisePreEnable < ActiveRecord::Base
    self.table_name = 'extranet.50_pre_habilitados'

    scope :by_cpf, -> (cpf) {
      where(cpf: cpf.to_s.unformat_cpf)
    }

    def cadastre
      ::Candidate::Cadastre.find_by(cpf: self.cpf)
    end

    def set_manifestation!
      a = ::Firm::EnterpriseCadastre.where(indication_type_id: 999, enterprise_id: 212).find_by(cadastre_id: self.cadastre_id)
      
      if a.nil?
        b = ::Firm::EnterpriseCadastre.where(indication_type_id: 999, enterprise_id: 212).new
        b.cadastre_id = self.cadastre.id
        b.inactive    = false
        b.save
      else
        a.destroy
      end
      
    end

    def ticket
      Firm::Ticket.find_by(cadastre_id: self.cadastre.id)
    end
    def ticket_supervisor
      !ticket.supervisor_date.nil? && ticket.supervisor
    end

    def ticket_close
      return false if ticket.nil?

      !ticket.supervisor_date.nil?
    end

    def indication
      a = ::Firm::EnterpriseCadastre.where(indication_type_id: 999, enterprise_id: 212).find_by(cadastre_id: self.cadastre_id)
      !a.nil?
    end 
  end
end