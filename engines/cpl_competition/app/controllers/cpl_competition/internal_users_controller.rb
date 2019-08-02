require_dependency 'cpl_competition/application_controller'

module CplCompetition
  class InternalUsersController < ApplicationController
    
    before_action :authenticate!
    before_action :administrator_user?
    
    def index
      @users = CplCompetition::InternalUser.all.order(:name)
    end
    
  end
end