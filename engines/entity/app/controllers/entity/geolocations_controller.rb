require_dependency 'entity/application_controller'

module Entity
  class GeolocationsController < ApplicationController

    has_scope :by_name
    has_scope :by_situation
    has_scope :by_city
    has_scope :by_region
    
    def index
      
      @entities = apply_scopes(Entity::Cadastre).all

      respond_to do |format|
        format.json {
          @entities
        }

        format.html
      end
    end

    def situation_entity
      @entity_complete     = Entity::Cadastre.complete.find_by_cnpj(params[:cnpj]) rescue nil

      render json: @entity_complete
    end


    def entities_2016
      @entities    = apply_scopes(Entity::Cadastre).all
    end

  end
end
