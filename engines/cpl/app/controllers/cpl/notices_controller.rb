require_dependency 'cpl/application_controller'

module Cpl
  class NoticesController < ApplicationController # :nodoc:
    def index
      if session[:user_id].present?
        @notices = Cpl::Notice.all
        @participant = Cpl::Participant.find(session[:user_id])
      else
        redirect_to new_session_path
      end
    end

    def download
      @notice = Cpl::Notice.find(params[:id])
      redirect_to @notice.attachment_url
    end
  end
end
