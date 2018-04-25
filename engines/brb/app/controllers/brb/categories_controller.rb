require_dependency "brb/application_controller"

module Brb
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :set_categories
    # GET /categories
    
    has_scope :by_id 
    
    def index
      respond_to do |format|
        format.html { @categories }
        format.json { render json: @categories }
      end
    end

    # GET /categories/1
    def show
    end

    # GET /categories/new
    def new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    def create
      @category = Category.new(category_params)
      @category.save
    end

    # PATCH/PUT /categories/1
    def update
      @category.update(category_params)
    end

    # DELETE /categories/1
    def destroy
      @category.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :status, :default_value, :description)
      end

      def set_categories
        @categories = apply_scopes(Category).all.order(:name)
      end
  end
end
