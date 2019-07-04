module CplCompetition
  class UserLogsController < ApplicationController
    
    def index
      @logs = CplCompetition::UserLog.where(user_id: current_user).order(created_at: :desc)
    end 

  end
end