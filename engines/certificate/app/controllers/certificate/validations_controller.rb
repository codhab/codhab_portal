require_dependency 'certificate/application_controller'

module Certificate
  class ValidationsController < ApplicationController # :nodoc:

    def new
      @validation = Certificate::Validation.new
    end

    def create
      @validation = Certificate::Validation.new(set_params)
      if @validation.valid?
        redirect_to document_path(n: @validation.cadastre_id)
      else
        render :new
      end
    end

    def document
      cadastre = params[:n]
      @certificate = Certificate::Cadastre.find(cadastre)
      @allotment = Certificate::Allotment.find(@certificate.allotment_id)
      render layout: 'application'
    end

    private

    def set_params
      params.require(:validation).permit(:name, :id, :document_date)
    end
  end
end
