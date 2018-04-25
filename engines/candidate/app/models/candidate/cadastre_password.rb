module Candidate
  class CadastrePassword
    include ActiveModel::Model

    attr_accessor :cpf, :candidate, :password, :password_confirmation

    attr_accessor :question_array 

    attr_accessor :response_one, :response_three, :response_four, :response_five

    attr_accessor :born, :name, :address, :telephone

    validates :cpf, cpf: true, presence: true
    validates :password, :password_confirmation, length: {minimum: 6}, presence: true, if: 'self.born.present?'
    
    validate  :cpf_valid?
      
    def create_question_array!
      self.question_array = Candidate::RandomizeAttributesService.new(current_candidate).random_values
    end

    # => OPERATIONS

    def update_password params
      self.errors.add(:password, "Senha não são iguais")            if params[:password] != params[:password_confirmation]
      self.errors.add(:password, "Senha não pode ficar em branco")  if params[:password].blank?
      
      if params[:password_confirmation].blank?
        self.errors.add(:password_confirmation, "Confirmação de senha não pode ficar em branco") 
      end 


      if !params[:password].blank? && params[:password].to_s.length < 6 
        self.errors.add(:password, "Senha é muito curta (mínimo 6 digítos)") 
      end

      if !params[:password_confirmation].blank? && params[:password_confirmation].to_s.length < 6 
        self.errors.add(:password_confirmation, "Confirmação de senha é muito curta (mínimo 6 digítos)") 
      end

      current_candidate.update(password: params[:password]) 
    end

    # => VALIDATORS

    def check_response!

      
      %w(born name address telephone).each do |attr|
        value = current_candidate.send(attr)
        value = (value.class == Date && value.present?) ? value.strftime("%d/%m/%Y") : value

        if value.to_s.length < 5
          value = nil
        end

        
        if value != ((self.send(attr) == "Nenhuma das opções") ? nil : self.send(attr))
          return false 
        end 

      end

      true
    end

    # => FORMATERS

    def questions_one_formated
      self.question_array[2]
    end

    def questions_three_formated
      self.question_array[4]
    end

    def questions_four_formated
      self.question_array[3]
    end
    
    def questions_five_formated
      self.question_array[1]
    end

    # => SETTERS

    def set_response_one params
      self.name = params[:cadastre_password][:response_one]
    end


    def set_response_three params
      self.telephone = params[:cadastre_password][:response_three]
    end

    def set_response_four params
      self.address = params[:cadastre_password][:response_four]
    end

    def set_response_five params
      self.born = params[:cadastre_password][:response_five]
    end

    private

    def cpf_valid?
      if !current_candidate.present?
        errors.add(:cpf, "CPF não encontrado na base de dados da CODHAB")
      end
    end

    def current_candidate
      Candidate::Cadastre.find_by(cpf: self.cpf) rescue nil
    end

  end
end