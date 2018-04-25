require_dependency 'main/application_controller'

module Main
  class GalleriesController < ApplicationController
    def index
      @galleries = Main::Gallery.where(status:true).order(created_at: :desc)
    end

    def show
      @gallery = Main::Gallery.find(params[:id])
    end

    def galleries_private
      @galleries = Main::Gallery.where(status:true).order(created_at: :desc)
    end

    def testes
      
    end
  end
end
