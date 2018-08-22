require_dependency 'cpl/application_controller'

module Cpl
  class NoticeParticipantsController < ApplicationController # :nodoc:
    def index
      if session[:user_id].present?
        @notice = Cpl::Notice.find(params[:notice_id])
        @participant = Cpl::Participant.find(session[:user_id])
        @notice_participant = Cpl::NoticeParticipant.find_by(participant_id: session[:user_id])

        unless @notice_participant.present?
          @notice_participant = Cpl::NoticeParticipant.new(
            notice_id: params[:notice_id],
            participant_id: session[:user_id],
            status: true
          )
          @notice_participant.save
        end
        @file = Cpl::DocumentParticipant.new
      else
        redirect_to new_session_path
      end
    end
  end
end
