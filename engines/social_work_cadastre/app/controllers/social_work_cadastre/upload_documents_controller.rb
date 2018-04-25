require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class UploadDocumentsController < ApplicationController

    before_action :set_cadastre
		before_action :set_upload_documents, only: [:index, :create, :destroy, :update]
    before_action :set_upload_document, only: [:edit, :destroy, :update]

    def index
      @upload_documents = @cadastre.upload_documents.where(cadastre_id: session[:current_external_company_id]).all
    end

    def new
      @upload_document = @cadastre.upload_documents.new
    end

    def create
      @upload_document = @cadastre.upload_documents.new(set_params)
      @upload_document.save
      redirect_to cadastre_path(@cadastre, q: 'd')
    end

    def update
      if @upload_document.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @upload_document.destroy
      redirect_to cadastre_path(@cadastre, q: 'd')
    end

    private

    def set_params
      params.require(:social_work_cadastre_upload_document).permit(:ststus, :document_type_id, :file_path, :observation, :cadastre_id)
    end

    def set_cadastre
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(session[:current_external_company_id])
    end

    def set_upload_document
      @upload_document = Core::SocialWorkCadastre::UploadDocument.find(params[:id])
    end

    def set_upload_documents
      @upload_documents = @cadastre.upload_documents.all
    end
  end
end
