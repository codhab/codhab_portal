require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class AskingsController < ApplicationController
      before_action :set_cadastre

      def new
        @asking = @cadastre.askings.new
      end

      def create
        @asking = @cadastre.askings.new(set_params)

        if @asking.save
          flash[:success] = t :success
          redirect_to action: :new
        else
          render action: :new
        end
      end


      private

      def set_params
        params.require(:asking).permit(:dependent, :income, :special_condition)
      end

      def set_cadastre
        @cadastre = ::Candidate::Cadastre.find(session[:cadastre_id]) rescue nil
      end

    end
  end
end