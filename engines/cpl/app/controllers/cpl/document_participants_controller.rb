require_dependency 'cpl/application_controller'

module Cpl
  class DocumentParticipantsController < ApplicationController # :nodoc:
    def index
      @participants = Cpl::NoticeParticipant.where(notice_id: params[:id])
      @notice = Cpl::Notice.find(params[:id])
    end

    def create
      @document = Cpl::DocumentParticipant.new(set_params)
      @document.save
      redirect_to notice_participants_path(notice_id: @document.notice_participant.notice.id)
    end

    private

    def set_params
      params.require(:document_participant).permit(:attachment, :document_notice_id,
                                                   :notice_participant_id)
    end
  end
end
