module Candidate
  class SubscribeRemember
    include ActiveModel::Model 

    attr_accessor :cpf, :born, :name, :rg, :subscribe_id

    validates :cpf, cpf: true, presence: true
    validates :born, :rg, :name, presence: true
    validate  :authenticate_information

    private

    def authenticate_information
      candidate = ::Candidate::Subscribe.find_by(cpf: self.cpf)

      if candidate.nil?
        errors.add(:base, 'Informações não são iguais as informadas no ato da inscrição')
      else
        if Date.parse(self.born) != candidate.born
          errors.add(:base, 'Informações não são iguais as informadas no ato da inscrição')
        else 

          rg_upcase = self.rg.to_s.mb_chars.upcase
          candidate_rg = candidate.rg.to_s.mb_chars.upcase

          if rg_upcase.similar(candidate_rg) < 70
            errors.add(:base, 'Informações não são iguais as informadas no ato da inscrição')
          else

            name_upcase = self.name.to_s.mb_chars.upcase
            candidate_name = candidate.name.to_s.mb_chars.upcase

            if name_upcase.similar(candidate_name) < 60
              errors.add(:base, 'Informações não são iguais as informadas no ato da inscrição')
            else
              self.subscribe_id = candidate.id
            end
          end
        end
      end
    end
  end
end