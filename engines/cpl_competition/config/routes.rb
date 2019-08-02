CplCompetition::Engine.routes.draw do
  root 'competitions#index'

  resources :external_users do 
    get 'confirmation'
    get 'send_confirmation'
  end

  resources :internal_users
  resources :user_logs
  resources :sessions
  
  resources :competitions do
    get 'special'
    resources :chats, controller: :competition_chats
    resources :documents, controller: :competition_documents
    resources :users, controller: :competition_users do
      resources :proposals, controller: :competition_user_proposals
      resources :documents, controller: :competition_user_documents
      resources :credentials, controller: :competition_user_credentials
    end

  end

  resources :users, only: [:edit, :update]
end
