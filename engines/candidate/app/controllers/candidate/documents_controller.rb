require_dependency 'candidate/application_controller'

module Candidate
	class DocumentsController < ApplicationController 
		
    def index
      @excel = Candidate::Document.all
    end

    def show
      @excel = Candidate::Document.find_by(entity_id: params[:id])
    end

	end
end 