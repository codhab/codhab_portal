Cpl::Engine.routes.draw do
  resources :sessions
  resources :participants

  resources :notices
  resources :notice_participants
  resources :document_participants

  get 'download', to: 'notices#download', as: 'download'
end
