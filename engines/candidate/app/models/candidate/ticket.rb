module Candidate
  class Ticket < ActiveRecord::Base
    self.table_name = "extranet.candidate_tickets"
    belongs_to :subject, class_name: "Candidate::Subject"
  end
end
