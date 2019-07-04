CplCompetition::Engine.routes.draw do
  root 'competitions#index'

  resources :external_users
  resources :user_logs
  resources :sessions
end
