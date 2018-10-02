require_dependency 'entity/application_controller'
module Entity
  class AuthorizationController < ApplicationController

    def new
      @authorization = Entity::Authorization.new
    end

    def create
      @authorization = Entity::Authorization.new(set_params)

      if @authorization.valid?
        if @authorization.old
          session[:entity_auth_id] = @authorization.id
          session[:entity_expiration_id] = Time.now + 2.hours
          redirect_to old_path(@authorization.id)
        else
          session[:entity_auth_id] = @authorization.id
          session[:entity_expiration_id] = Time.now + 2.hours
          redirect_to entity_area_path
        end
        
       
      else
        render action: 'new'
      end
    end

    def destroy
      session[:entity_auth_id] = nil
      session[:entity_expiration_id] = nil

      redirect_to entity.new_authorization_path

    end

    private

    def set_params
      params.require(:authorization).permit(:cnpj, :password)
    end

  end
end
