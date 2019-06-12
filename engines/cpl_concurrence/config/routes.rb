CplConcurrence::Engine.routes.draw do
  root 'notices#index'

  resources :notices,   path: 'editais'
  resources :passwords, path: 'minha-senha'
  resources :sessions,  path: 'acesso'
  resources :remembers, path: 'lembrar-senha'

  resources :users,    path: 'usuario' do 
    get 'confirmation_email', on: :collection, path: 'confirmacao-email'

    resources :notices, controller: :user_notices, path: 'editais'
    resources :notice_participations, controller: :user_notice_participations, path: 'edital-participacoes' do
      get 'general'

      resources :documents, controller: :user_notice_documents
      resources :chats, controller: :user_notice_participation_chats
    end
  end

end
