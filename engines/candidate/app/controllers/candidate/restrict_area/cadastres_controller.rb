require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea 
    class CadastresController < ApplicationController
      before_action :authenticate_cadastre
      before_action :set_cadastre

      def edit
        
      end

      def update

        if @cadastre.update(set_params)
          flash[:success] = t :success
          redirect_to action: :edit
        else
          render action: :edit 
        end

      end


      private

      def set_params
        params.require(:cadastre_update).permit(:telephone, :email, :telephone_optional, :celphone, :cep, :city_id,
                                         :address)

      end

      def set_cadastre
        @cadastre        = ::Candidate::Cadastre.find(session[:cadastre_id])
        @cadastre_update = ::Candidate::CadastreUpdate.find(session[:cadastre_id])
      end

    end
  end
end