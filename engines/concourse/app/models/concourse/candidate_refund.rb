module Concourse
  class CandidateRefund < ApplicationRecord # :nodoc:
    belongs_to :new_candidate, class_name: 'Concourse::Candidate', foreign_key: :candidate_id
    belongs_to :state, required: false, class_name: 'Core::Address::State'
    belongs_to :city, required: false, class_name: 'Core::Address::City'

    enum account_type_id: %i[conta_corrente conta_poupança]

    validates :account, :agency, :bank_number, presence: true
    validates :account_type_id, presence: true
    validates :state_id, :city_id, :address, :agency_name, presence: true
  end
end
