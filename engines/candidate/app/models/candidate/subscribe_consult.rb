module Candidate
  class SubscribeConsult 
    include ActiveModel::Model

    attr_accessor :cpf, :cadastre_id, :cadastre

    validates :cpf, cpf: true, presence: true
    validate  :cpf_subscribed?

    def save
      return false if !valid?

      true 
    end 

    private

    def cpf_subscribed?
      @cadastre = ::Candidate::Subscribe.find_by(cpf: self.cpf)
      
      if @cadastre.nil?
        errors.add(:cpf, 'CPF não está inscrito na inscrição (2020)')
      end
    end
  end
end