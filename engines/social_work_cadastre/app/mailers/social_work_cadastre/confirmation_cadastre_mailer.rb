module SocialWorkCadastre
  class ConfirmationCadastreMailer < ActionMailer::Base
    default from: 'suporte@codhab.df.gov.br'

    def confirmation(cadastre)
      @cadastre           = Core::SocialWorkCadastre::Cadastre.find(cadastre.id)
      mail(to: @cadastre.email, subject: "Cadastro finalizado com sucesso")
    end

    def completed_data(cadastre)
      @cadastre           = Core::SocialWorkCadastre::Cadastre.find(cadastre.id)
      mail(to: @cadastre.email, subject: "Cadastro finalizado com sucesso")
    end
  end
end
