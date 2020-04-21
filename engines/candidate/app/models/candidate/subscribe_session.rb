module Candidate
  class SubscribeSession
    include ActiveModel::Model

    attr_accessor :cpf, :password, :subscribe_id

    validates :cpf, cpf: true, presence: true
    validates :password, presence: true

    validate :auth

    private

    def auth
      subscribe = Candidate::Subscribe.find_by(cpf: self.cpf)

      if subscribe.nil? || (subscribe.password != self.password)
        errors.add(:cpf, 'CPF ou senha não conferem, verifique')  
      else
        self.subscribe_id = subscribe.id
      end
    end
  end
end