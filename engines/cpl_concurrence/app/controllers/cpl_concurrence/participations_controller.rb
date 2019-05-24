module CplConcurrence
  class ParticipationsController < ApplicationController
    before_action :authenticate_user
    
    def index
      @notices = CplConcurrence::Notice.where(status: true).order(:number)
    end 

    def show
    end 

  end
end