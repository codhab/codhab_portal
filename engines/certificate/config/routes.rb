Certificate::Engine.routes.draw do
  resources :validations
  get 'document', to: 'validations#document'
end
