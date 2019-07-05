CplCompetition::Engine.routes.draw do
  root 'competitions#index'

  resources :external_users
  resources :internal_users
  resources :user_logs
  resources :sessions
  resources :competitions
  resources :users, only: [:edit, :update]
end
