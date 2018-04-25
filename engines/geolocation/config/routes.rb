Geolocation::Engine.routes.draw do
  resources :cadastres, path: 'cadastros' do 
    collection do 
      get 'show', path: 'lista', as: :list
    end
  end
end
