class Indication
  include ActiveModel::Model

  attr_accessor :cpf, :password

  validates :cpf, cpf: true, presence: true
  validates :password, presence: true

  validate  :cpf_is_valid

  def save
    if valid?
      # Logica de manifestacao
    end
  end 

  private

  def cpf_is_valid
    general = ::Candidate::View::GeneralPontuation
                  .where(situation_status_id: 4)
                  .where(procedural_status_id: [14,72])
                  .where('convocation_id > 1524')
                  .where(income: 0..1800)
                  .find_by(cpf: self.cpf)
    
    if !general.present?
      errors.add(:cpf,'CPF não está apto a manifestar. Somente candidatos Faixa 1 (até R$ 1800,00) e que estejam habilitados na CODHAB')
    end
  end
end