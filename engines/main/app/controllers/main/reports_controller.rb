require_dependency 'main/application_controller'
module Main
  class ReportsController < ApplicationController

    def index
     @reports = Main::Report.where(external:true).order(created_at: 'DESC')
    end

    def show
      @report = Main::Report.find(params[:id])
    end
  end
end
