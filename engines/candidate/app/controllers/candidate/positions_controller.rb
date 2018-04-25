require_dependency 'candidate/application_controller'

module Candidate
	class PositionsController < ApplicationController 
		
    has_scope :by_program

		def index
		end

    def event
      @position = ::Candidate::Position.find(params[:position_id])
    end


		def show
      begin
        @cadastre  = ::Candidate::Cadastre.find(params[:id])
        @positions = apply_scopes(@cadastre.positions).all
      rescue
        redirect_to '/404'
      end
		end

	end
end 