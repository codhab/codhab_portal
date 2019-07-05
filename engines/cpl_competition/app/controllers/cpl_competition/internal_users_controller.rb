require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class InternalUsersController < ApplicationController
    
    before_action :authenticate!
    
    def index
      @users = CplCompetition::InternalUser.all.order(:name)
    end
    
  end
end