require_dependency 'main/application_controller'

module Main
  class PagesController < ApplicationController

    def index
      @page = Page.all
    end

    def show
      @page = Main::Page.find(params[:id]) 
    end


  end
end
