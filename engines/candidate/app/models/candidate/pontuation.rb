module Candidate
  class Pontuation < ActiveRecord::Base
    self.table_name = "extranet.candidate_pontuations"

    default_scope { order('created_at DESC')}

  end
end
