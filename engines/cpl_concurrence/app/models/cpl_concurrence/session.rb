module CplConcurrence
  class Session
    include ActiveModel::Model

    attr_accessor :cpf_cnpj, :password, :user_id

    validates :cpf_cnpj, :password, presence: true
    validate  :authenticate
    
    def save
      return false if !valid?

      true
    end

    private

    def authenticate
      user = ::CplConcurrence::User.where('cpf = ? OR cnpj = ?', self.cpf_cnpj, self.cpf_cnpj).last rescue nil

      if user.nil?
        errors.add(:cpf_cnpj, 'CPF ou CNPJ não encontrado, senha não confere')
      else
        self.user_id = user.id
      end
    end
  end
end