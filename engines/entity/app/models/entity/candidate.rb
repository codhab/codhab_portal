module Entity
  class Candidate < ActiveRecord::Base
    self.table_name = 'extranet.entity_candidates'

    belongs_to :candidate, class_name: "::Candidate::Cadastre", foreign_key: 'candidate_id', primary_key: 'id'
  end
end