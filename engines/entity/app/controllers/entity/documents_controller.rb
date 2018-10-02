require_dependency 'entity/application_controller'
module Entity
	class DocumentsController < ApplicationController
	 before_action :validate_session!
	 before_action :set_entity
	
	def new 
		@document = @entity.documents.new
	end

	def create
		@document = @entity.documents.new(document_params)
		@document.old_id = @entity.id 
		if @document.save
			redirect_to old_path(@entity.id)
		else
			render :new
		end
	end
	
	private

		def document_params
			params.require(:document).permit(:document_category_id, :archive_path, :observation, :old_id)
		end
		
		def set_entity
			@entity = Entity::Old.find(session[:entity_auth_id])
		end

    def set_document
      @document = Entity::Document.find(params[:id])
		end
		

		def validate_session!
			if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
				@entity = Entity::Old.find(session[:entity_auth_id])
			else
				redirect_to entity.new_authorization_path
			end
		end
	end
end