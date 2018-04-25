module Candidate
  class Question < ActiveRecord::Base
    self.table_name = "extranet.candidate_questions"
    belongs_to :subject
    enum status: [:open,:in_progress,:closed]
    validates_presence_of :message
    def add_ticket candidate
      ticket = ::Candidate::Ticket.new({
        cadastre_id: candidate.id,
        status: 0,
        subject_id: subject.id
      })

      ticket.save

      self.update(ticket_id: ticket.id)
    end
    validates :attachment, file_size: { less_than_or_equal_to: 100.megabytes.to_i,
                                   message: "Arquivo não pode exceder 100 MB" }

    mount_uploader :attachment, Candidate::FileUploader
  end
end
