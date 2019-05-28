module CplConcurrence
  class Session
    include ActiveModel::Model

    attr_accessor :cpf_cnpj, :password, :user_id

    validates :cpf_cnpj, :password, presence: true
    validate  :authenticate
    
    def save
      return false if !valid?

      log = ::CplConcurrence::NoticeUserLog.new
      log.user_id = self.user_id
      log.content = "Acesso realizado com uso da senha pessoal"
      log.save
      
      true
    end

    private

    def authenticate
      user = ::CplConcurrence::User.where('cpf = ? OR cnpj = ?', self.cpf_cnpj, self.cpf_cnpj).last rescue nil

      if user.nil? || user.password != self.password
        errors.add(:cpf_cnpj, 'Dados informados não conferem')
      else
        self.user_id = user.id
      end
      
    end
    
  end
end