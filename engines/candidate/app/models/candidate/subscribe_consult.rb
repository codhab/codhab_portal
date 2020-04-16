module Candidate
  class SubscribeConsult 
    include ActiveModel::Model

    attr_accessor :cpf, :cadastre_id

    validates :cpf, cpf: true, presence: true
    validate  :cpf_subscribed?

    def save
      return false if !valid?


      true 
    end 

    private

    def cpf_subscribed?
    end
  end
end