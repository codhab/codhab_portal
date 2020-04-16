module Candidate
  class SubscribeDependent < ActiveRecord::Base
    self.table_name = 'sihab.candidate_subscribe_dependents'
    
    belongs_to :subscribe

    validates :name, presence: true
  end
end