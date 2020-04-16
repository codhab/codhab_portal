module Candidate
  class Subscribe < ActiveRecord::Base
    self.table_name = 'sihab.candidate_subscribes'
    
    has_many :subscribe_dependents

    accepts_nested_attributes_for :subscribe_dependents, allow_destroy: true
    
    validates :name, presence: true
  end
end