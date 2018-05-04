require_dependency 'entity/application_controller'

module Entity
  class ValidatesController < ApplicationController # :nodoc:
    def new
      @validate = Entity::Validate.new
    end

    def create
      @validate = Entity::Validate.new(set_params)
      if @validate.valid?
        redirect_to validate_path(@validate.id)
      else
        render :new
      end
    end

    def show
      @validate = Core::Entity::ValidateDocument.find(params[:id])
    end

    private

    def set_params
      params.require(:validate).permit(:cnpj)
    end
  end
end
