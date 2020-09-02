module Candidate
  class NegativeCrixaIndicationForm 
    include ActiveModel::Model

    attr_accessor :cadastre_id, :observation

    validates :cadastre_id, :observation, presence: true

    def save 
      return false if invalid?
      
      crixa = ::Firm::EnterpriseCadastre.where(enterprise_id: 182, inactive: false, cadastre_id: self.cadastre_id)
      
      if crixa.present?
        crixa.update_all(inactive: true, inactive_date: Date.current, observation: "Desistência realizada através de resposta a SMS")
      end

      true
    end
  end
end