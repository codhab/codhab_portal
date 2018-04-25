module Geolocation
  class CadastresController < ApplicationController
    
    has_scope :by_type 
    has_scope :by_city
    has_scope :by_income
    has_scope :by_pontuation_range
    has_scope :by_list
    has_scope :by_update
    has_scope :by_situation
    

    def index
      @geolocations = apply_scopes(::Candidate::CadastreGeolocation).cadastres_max
                                                                    .where("extranet.candidate_cadastre_geolocations.lat <> 'undefined'") 
      @url = request.original_url 

      respond_to do |format|
        format.html { @geolocations }
        format.json {
          render json: @geolocations
        }
      end
    end

    def show
      @geolocations = apply_scopes(::Candidate::CadastreGeolocation).cadastres_max
                                                                    .where("extranet.candidate_cadastre_geolocations.lat <> 'undefined'") 
    end

  end
end