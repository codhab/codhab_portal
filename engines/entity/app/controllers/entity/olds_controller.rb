require_dependency 'entity/application_controller'
module Entity
	class OldsController < ApplicationController
	 before_action :validate_session!
	 before_action :set_entity, only: [:show, :edit, :update]
	
	def show
		# @entity = Core::Entity::Old.find(params[:id])
	end

	def edit
	end

	def update
		# @entity.president_cpf = @entity.president_cpf.gsub('.','').gsub('-','')
		if @entity.update(entity_params)
			redirect_to action: 'show'
		else
			render :edit
		end
	end
	
	private

		def entity_params
			params.require(:old).permit(:name,:telephone, :email, :president_name,:president_cpf, :password,:password_confirmation, :address, :city_id, :cep, :fantasy_name)
		end
		
		def set_entity
			@entity = Entity::Old.find(params[:id])
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
