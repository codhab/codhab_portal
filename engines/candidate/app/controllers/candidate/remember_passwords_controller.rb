require_dependency 'candidate/application_controller'

module Candidate
  class RememberPasswordsController < ApplicationController
    before_action :allow_iframe
    
    @@password = {}

    def index
      redirect_to action: :new
    end

    def new
      session[:cpf]       = nil
      session[:questions] = nil

      @password = Candidate::CadastrePassword.new
    end

    def create
      @password = Candidate::CadastrePassword.new(set_params)
      
      if @password.valid?
        @password.create_question_array!
        
        session[:questions] = @password.question_array
        session[:cpf]       = @password.cpf
      end

    end



    def update_question_one

      respond_to do |format|
        format.js {
          @password = Candidate::CadastrePassword.new 
          @password.cpf = session[:cpf]
          @password.question_array = session[:questions] 
          @password.set_response_one(params)

          session[:response_one] = @password.name    
        }

        format.html {}
      end
    end

   
    def update_question_three
      respond_to do |format|
        format.js {
          @password = Candidate::CadastrePassword.new 
          @password.cpf = session[:cpf]
          @password.question_array = session[:questions] 
          @password.set_response_three(params)

          session[:response_three] = @password.telephone  
        }
        format.html {}
      end
    end

    def update_question_four
      respond_to do |format|
        format.js {
          @password = Candidate::CadastrePassword.new 
          @password.cpf = session[:cpf]
          @password.question_array = session[:questions] 
          @password.set_response_four(params)

          session[:response_four] = @password.address 
        }
        format.html {}
      end
    end

    def update_question_five
      
      @password = Candidate::CadastrePassword.new 
      @password.cpf = session[:cpf]
      @password.question_array = session[:questions] 
      @password.set_response_five(params)

      @password.name           = session[:response_one]
      @password.telephone      = session[:response_three]
      @password.address        = session[:response_four]
      
      session[:response_five] = @password.born 
      
    end

    def fail_password
    end

    def edit_password

      @password = Candidate::CadastrePassword.new 
      @password.cpf = session[:cpf]
      @password.question_array = session[:questions] 
      @password.name           = session[:response_one]
      @password.telephone      = session[:response_three]
      @password.address        = session[:response_four]
      @password.born           = session[:response_five]

    end

    def update_password
      @password = Candidate::CadastrePassword.new
      @password.cpf = session[:cpf]

      @password.update_password(set_update_params)

    end

    private

    def set_params
      params.require(:cadastre_password).permit(:cpf)
    end

    def set_update_params
      params.require(:cadastre_password).permit(:password, :password_confirmation)
    end

    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end

    def set_params_find
      params.require(:find).permit(:cpf)
    end

    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end
  end
end
