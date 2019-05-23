module Regularization
  class RequestMailer < ActionMailer::Base
    default from: 'suporte@codhab.df.gov.br'

    def panic_solicitation(email)
      @panic = Dashboard::Panic.find(panic.id)
      mail(to: email, subject: "panico")
    end
  end
end
