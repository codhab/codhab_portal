require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class CadastreStepsController < ApplicationController # :nodoc:
    layout 'layouts/social_work_cadastre/application'

    before_action :set_cadastre
    before_action :set_step, only: [:edit, :destroy, :update]

    def create
      @step = @cadastre.steps.new(set_params)
       if @step.save
         begin
           SocialWorkCadastre::ConfirmationCadastreMailer.confirmation(@cadastre).deliver_now! if @cadastre.steps.where(step: 1).present? && @cadastre.steps.where(step: 2).present? && @cadastre.steps.where(step: 3).present?
         rescue
         end
      end
    end

    def destroy
      @step.destroy
    end

    private

    def set_params
      params.require(:social_work_cadastre_cadastre_step).permit(:step)
    end

    def set_step
      @step = Core::SocialWorkCadastre::CadastreStep.find(params[:id])
    end

    def set_cadastre
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:cadastre_id])
    end
  end
end
