Attendance::Engine.routes.draw do

  root 'cadastres#index'

  resources :profiles, only: [:edit, :update]
  
  resources :remember_passwords
  resources :cadastres do
    collection do
      get 'detail',       to: 'cadastres#detail'
      get 'pontuation',   to: 'cadastres#pontuation'
      get 'dependent',    to: 'cadastres#dependent'
      get 'occurrence',   to: 'cadastres#occurrence'
      get 'entity',       to: 'cadastres#entity'
      get 'situation',    to: 'cadastres#situation'
      get 'address',      to: 'cadastres#address'
      get 'schedule',     to: 'cadastres#schedule'
      get 'document',     to: 'cadastres#document'
      get 'indication',   to: 'cadastres#indication'
    end
  end
  
  resources :sessions, only: [:new, :create] do
    delete 'logout', to: 'sessions#destroy', on: :collection
  end
  resources :notifications

  resources :tickets do

    get '/confirm/:action_id',          to: 'tickets#confirm',          as: :confirm
    get '/open/:action_id',             to: 'tickets#open',             as: :open
    get '/close',                       to: 'tickets#close',            as: :close
    get '/close_action/:action_id',     to: 'tickets#close_action',     as: :close_action
    get '/close_dependent/:action_id',  to: 'tickets#close_dependent',  as: :close_dependent

    get '/update_cadastre',  to: 'tickets#update_cadastre',   as: :update_cadastre
    get '/update_dependent', to: 'tickets#update_dependent',  as: :update_dependent
    get '/update_income',    to: 'tickets#update_income',     as: :update_income
    get '/update_contact',   to: 'tickets#update_contact',    as: :update_contact

    get '/continue_cadastre/:action_id',  to: 'tickets#continue_cadastre',   as: :continue_cadastre
    get '/continue_dependent/:action_id', to: 'tickets#continue_dependent',  as: :continue_dependent
    get '/continue_income/:action_id',    to: 'tickets#continue_income',     as: :continue_income
    get '/continue_contact/:action_id',   to: 'tickets#continue_contact',    as: :continue_contact

    resources :cadastres
    resources :dependents
    resources :incomes
    resources :contacts

    resources :action, only: nil do
      resources :documents
    end

  end

  #resources :chats do
  #  resources :chat_comments
  #end

  resources :requeriments
  resources :schedules

  resources :external_requeriments
end
