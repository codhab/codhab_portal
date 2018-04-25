module Attendance
  class Session
    include ActiveModel::Model

    attr_accessor :cpf, :password, :id


    validates :cpf, cpf: true, presence: true
    validates :password, presence: true
    validate  :authenticate

    private

    def authenticate
      @cadastre      = Core::Candidate::Cadastre.find_by(cpf: self.cpf) rescue nil
      staff_password = self.password.split('@') rescue nil
      
      @staff = Core::Person::Staff.where(code: staff_password[0], password: staff_password[1]).first rescue nil
      
      if !@cadastre.nil? && (@cadastre.password == self.password) || @staff.present?
        @id = @cadastre.id
      else
        errors.add(:cpf, "CPF ou senha não conferem") 
      end
      
    end 

  end
end