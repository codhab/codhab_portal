module Concourse
  class RefundValidate # :nodoc:
    include ActiveModel::Model
    attr_accessor :password, :candidate_id

    validates :candidate_id, :password, presence: true
    validate :credential_valid?

    private

    def credential_valid?
      new_candidate = Concourse::Candidate.where(id: candidate_id, subscribe_id: 19).first rescue nil
      if new_candidate.present?
        if new_candidate.password != self.password
          errors.add(:candidate_id, "Nº de inscrição ou senha não conferem")
        end
        refund_did = Concourse::CandidateRefund.find_by(candidate_id: new_candidate.id)
        if refund_did.present?
          errors.add(:candidate_id, "Já recebemos o seu pedido de reembolso, aguarde o retorno da CODHAB.")
        end
      else
        errors.add(:candidate_id, "Nº de inscrição não pertence a este concurso.")
      end
    end

  end
end
