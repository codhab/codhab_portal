Brb::Engine.routes.draw do
  resources :categories, path: 'categorias'
  resources :invoices,   path: 'boletos'
  resources :remittances
  resources :returns
end
