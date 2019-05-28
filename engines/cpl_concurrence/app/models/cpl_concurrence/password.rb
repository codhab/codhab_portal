module CplConcurrence
  class Password
    include ActiveModel::Model
  
    attr_accessor :current_password, :new_password, :confirmation_password, :user_id

    validates :current_password, :new_password, :confirmation_password, presence: true
    validate  :password_is_equal?

    def save
      return false if !valid?

      user = ::CplConcurrence::User.find_by(id: self.user_id)
      user.password = self.new_password
      user.save(validate: false)

      log = ::CplConcurrence::NoticeUserLog.new
      log.user_id = self.user_id
      log.content = "Senha alterada com uso da senha pessoal"
      log.save
      
      true 
    end

    private

    def password_is_equal?
      user = ::CplConcurrence::User.find_by(id: self.user_id)

      if self.current_password != user.password
        errors.add(:current_password, "não é igual ao cadastrado")
      end
      
      if self.new_password != self.confirmation_password
        errors.add(:new_password, "não é igual a confirmação")
      end
    end
  end
end