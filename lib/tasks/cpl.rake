namespace :cpl do 
  task user: :environment do 
    user = CplCompetition::User.new
  
    user.name       = 'Desenvolvedor'
    user.cpf        = '04787910116'
    user.cnpj       = nil
    user.email      = 'elton.silva@codhab.df.gov.br'
    user.telephone  = nil
    user.password   = '123456789'
      
    user.confirmation       = true
    user.confirmation_at    = Time.now
    user.confirmation_token = nil
    
    user.administrator      = true
    p user.save!  
  end 
end