Entity::Engine.routes.draw do
  root 'cadastres#index'

  get     'new_authorization',  path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
  post    'create_authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  delete  'destroy_authorization',  path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

  get 'entity_area', path: 'area_entidade', to: 'area#index'


  resources :cadastres, path: 'cadastros'
  resources :events, path: 'eventos'
  resources :geolocations, path: 'localizacao'
  resources :olds, path: 'entidades_antigas'

#  resources :interests do
#    get 'update'
#  end

  get 'entidades_anteriores', to: 'application#test'

  resources :validates, path: 'validar'
end
