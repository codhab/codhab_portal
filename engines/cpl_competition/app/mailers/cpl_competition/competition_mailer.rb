module CplCompetition
  class CompetitionMailer < ActionMailer::Base
    default from: 'nao-responda@codhab.df.gov.br'

    def confirmation(user, email)
      @user  = user
      @email = email

      if Rails.env.production?
        default_url_options[:host] = 'http://www.codhab.df.gov.br'
      else
        default_url_options[:host] = 'http://localhost:3000'
      end 

      mail(to: @email, subject: "CODHAB - Confirmação de e-mail para participação de concorrência virtual")
    end

  end
end 