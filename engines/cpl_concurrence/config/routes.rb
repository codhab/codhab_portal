CplConcurrence::Engine.routes.draw do
  root 'notices#index'

  resources :notices,  path: 'editais'
  resources :sessions, path: 'acesso'

  resources :users,    path: 'usuario' do 
    get 'confirmation_email', on: :collection

    resources :notices, controller: :notice_participations
    resources :participations
  end

end
