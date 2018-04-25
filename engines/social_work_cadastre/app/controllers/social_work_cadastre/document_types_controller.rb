require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class DocumentTypesController < ApplicationController

    before_action :set_document_type, only: [:edit, :destroy, :update]

    def index
      @document_types = Core::SocialWorkCadastre::DocumentType.all
    end

    def new
      @document_type = Core::SocialWorkCadastre::DocumentType.new
    end

    def create
      @document_type = Core::SocialWorkCadastre::DocumentType.new(set_params)

      if @document_type.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def update
      if @document_type.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @document_type.destroy
      redirect_to cadastre_path(session[:current_external_company_id], q: 'd')
    end

    private

    def set_params
      params.require(:document_type).permit(:name, :status, :description, :order)
    end

    def set_document_type
      @document_type = Core::SocialWorkCadastre::DocumentType.find(params[:id])
    end
  end
end
