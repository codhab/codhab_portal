module CplCompetition
  class UserLogsController < ApplicationController
    
    before_action :authenticate!
    
    def index
      @logs = CplCompetition::UserLog.where(user_id: current_user).order(created_at: :desc)
    end 

  end
end