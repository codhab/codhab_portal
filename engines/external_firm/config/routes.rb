ExternalFirm::Engine.routes.draw do
  resources :sessions, path: 'acesso' do
    collection do
      delete 'logout'
    end
  end
  resources :cadastres, path: 'cadastro'
end
