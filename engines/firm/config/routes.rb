Firm::Engine.routes.draw do

  get     'new_authorization',  path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
  post    'create_authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  delete  'destroy_authorization',  path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

  resources :enterprise_cadastres,           path: 'candidatos'
  resources :enterprise_cadastre_situations, path: 'situacao'

  resources :bookings,    path: 'reserva',    only: [:new, :create]
  resources :sellings,    path: 'contemplar', only: [:new, :create]
  resources :refunds,     path: 'distrato',   only: [:new, :create]

  resources :enterprise_units, path: 'enderecos' do
      resources :cadastre_address, path: 'candidato_unidade'
  end

  resources :user_companies, path: 'usuarios' do
    collection do
      get 'refresh_token', as: 'refresh_token'
    end
  end

  get 'enable' , to: 'enterprise_cadastres#enable',  as: 'enable_enterprise_cadastres'
  get 'enterprise_statuses/:id/:cadastre_id', to: 'enterprise_statuses#create',      as: 'create_enterprise_statuses'

  get 'edit_access_data', to: 'sessions#edit',    as: 'edit_session'
  put 'access_data/:id',  to: 'sessions#update',  as: 'session'

  namespace :api do
    scope ':token_id' do
      resources :candidates, only: [:index, :show],   path: 'candidatos'
      resources :units,      only: [:index, :show],   path: 'enderecos'
      resources :sellings,   only: [:create],         path: 'venda'
      resources :deliveries, only: [:create],         path: 'entrega'
      resources :bookings,   only: [:create],         path: 'reserva'
      resources :refunds,    only: [:create],         path: 'liberar'
      resources :situations, only: [:index, :create], path: 'situacoes'
    end
  end
end
