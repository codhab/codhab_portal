require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class SessionsController < ApplicationController


      def index
        redirect_to action: :new
        
        @tickets_ref = ::Candidate::CadastreReferences.where(cpf: @cadastre.cpf, code: 'convocation_1000')
      end

      def new

        if !params[:lon].to_s.empty? && !params[:lat].to_s.empty?
          session[:lng] = params[:lon]
          session[:lat] = params[:lat]
        end

        @session = Candidate::Session.new
      end

      def create
        @session = Candidate::Session.new(set_params)

        if @session.valid?
          @geo = ::Candidate::CadastreGeolocation.new({
            cadastre_id: @session.id,
            lat: session[:lat],
            lng: session[:lng]
          })

          @geo.save if session[:lat].present? && session[:lng].present?

          session[:cadastre_id]      = @session.id
          session[:cadastre_expires] = Time.now + 2.hours
          redirect_to restrict_area_root_path

        else
          render action: :new
        end
      end

      def logout
        session[:cadastre_id]      = nil
        session[:cadastre_expires] = nil

        redirect_to restrict_area_root_path
      end

      private

      def set_params
        params.require(:session).permit(:cpf, :password, :captcha)
      end


    end
  end
end
