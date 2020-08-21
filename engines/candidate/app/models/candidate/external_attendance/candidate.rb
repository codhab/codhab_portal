module Candidate
  module ExternalAttendance
    class Candidate < ActiveRecord::Base
      self.table_name = 'extranet.pre_habilitados'

      scope :by_cpf, -> (cpf) {
        where(cpf: cpf.to_s.unformat_cpf)
      }

      
    end
  end
end