module Candidate
  class CrixaIndicationForm 
    include ActiveModel::Model

    attr_accessor :cpf, :born, :cadastre_id

    validates :cpf, :born, presence: true

    validate :is_indication?

    private

    def is_indication?
      cadastre = ::Candidate::Cadastre.where(cpf: self.cpf, born: self.born).first rescue nil

      if cadastre.nil?
        errors.add(:cpf, "CPF ou data de nascimento não conferem com os dados do cadastro na CODHAB; Faça seu agendamento diretamente nos agendamentos CODHAB, <a href='http://www.codhab.df.gov.br/agendamento/habitacao'>Clique aqui</a>".html_safe)
      else
        schedules = ::Schedule::DataReference.where(code: 'crixa-setembro-2020').find_by(cpf: self.cpf)

        if !schedules.nil?
          errors.add(:cpf, "CPF informado não está apto para agendar atendimento. Este agendamento é direcionado para os indicados ao Crixá que ainda não formalizaram dossiê.")
        else
          self.cadastre_id = cadastre.id
        end
      end
    end
  end
end