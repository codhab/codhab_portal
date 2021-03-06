require_dependency 'cpl_concurrence/application_controller'

module CplConcurrence
  class NoticesController < ApplicationController
    
    def index
      @notices = CplConcurrence::Notice.all.order(:number)
    end 

    def show
      @notice = CplConcurrence::Notice.find(params[:id])
    end 

    
  end
end