require_dependency 'entity/application_controller'
module Entity
  class AreaController < ApplicationController
    before_action :validate_session!

    def index
       @entity = Core::Entity::Cadastre.find(session[:entity_auth_id])
       @entity = Core::Entity::CadastrePolicy.new(@entity)
    end


    private

     def validate_session!
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Core::Entity::Cadastre.find(session[:entity_auth_id])
        else

          redirect_to entity.new_authorization_path
        end
      end
  end
end
