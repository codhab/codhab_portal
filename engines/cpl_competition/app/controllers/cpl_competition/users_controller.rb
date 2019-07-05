require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class UsersController < ApplicationController

    before_action :authenticate!
    
    def index
      
    end 

    def edit 
      @user = current_user
    end
  end
end