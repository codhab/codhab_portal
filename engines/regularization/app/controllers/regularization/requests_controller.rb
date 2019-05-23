require_dependency 'regularization/application_controller'

module Regularization
  class RequestsController < ApplicationController
    
    has_scope :by_block
    has_scope :by_group
    has_scope :by_city
    has_scope :by_unit
    
    def index
      respond_to do |f|

        f.html {
          redirect_to action: :new
        }

        f.json {
          @units = apply_scopes(Core::Address::Unit.where(city_id: 821))
        }
      end
      
    end

    def new
      @request = Regularization::Request.new
    end

    def create
      @request = Regularization::Request.new(set_params)
      
      if @request.save
        # enviar um email
      else
        render action: :new
      end

    end

    private

    def set_params
      params.require(:request).permit(:city_id, :block, :group, :unit, :name, :cpf, 
                                      :telephone, :telephone_optional, :email,
                                      :file , :description)
    end


  end
end
