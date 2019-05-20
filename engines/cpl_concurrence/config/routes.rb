CplConcurrence::Engine.routes.draw do
  resources :notices,  path: 'editais'
  resources :sessions, path: 'acesso'
  resources :users,    path: 'usuario'
end
