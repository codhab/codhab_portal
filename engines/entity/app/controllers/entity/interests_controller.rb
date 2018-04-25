require_dependency 'entity/application_controller'

module Entity
  class InterestsController < ApplicationController
    before_action :set_address

    def index

    end

    def update
      @interest = @current_entity.interests.find_by(unit_sale_id: params[:interest_id])  rescue nil

      if @interest.present?
        @interest.destroy
      else
        @interest = @current_entity.interests.new(unit_sale_id: params[:interest_id])
        @interest.save
      end
      redirect_to interests_path
    end

    private

    def set_address
      @current_entity = Core::Entity::Cadastre.find(session[:entity_auth_id])
      @address = Core::Entity::UnitSale.all
      @interests = @current_entity.interests
    end
  end
end
