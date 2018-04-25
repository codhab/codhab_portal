module Candidate
  class Asking < ActiveRecord::Base
    self.table_name = 'extranet.candidate_askings'
    
    validates :dependent, :special_condition, presence: true, numericality: true
    validates :income, presence: true, numericality: {only_float: true}
  end  
end