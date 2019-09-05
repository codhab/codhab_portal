SocialWorkCadastre::Engine.routes.draw do
  resources :sessions, path: 'acesso' do
    collection do
      delete 'logout'
    end
  end

  resources :dashboard
  get '/presentation', to: 'dashboard#presentation', as: 'presentation', path: '01-2019-0021'
  get '/attach', to: 'dashboard#attach', as: 'attach'
  get '/inform', to: 'dashboard#inform', as: 'inform'
  get '/result', to: 'dashboard#result', as: 'result'

  resources :document_types, path: 'tipo_documento'
  resources :locations, path: 'localidades'

  resources :cadastres, path: 'cadastro' do
    resources :upload_documents, path: 'envio_documento'
    resources :cadastre_locations, path: 'cadastre_locales'
    resources :cadastre_members, path: 'quadro_tecnico'
    resources :cadastre_titulars, path: 'titular'
    resources :responsibles, path: 'responsaveis'
    resources :cadastre_steps, path: 'passos'
  end
  get '/show',               to: 'cadastres#show',               as: 'show'
  get '/show_location',      to: 'locations#show_location',      as: 'show_location'
  get 'locales',             to: 'cadastre_locations#locales',   as: 'locales'
  get 'destroy',             to: 'cadastre_locations#destroy',   as: 'destroy'
  get '/update_sicaf',       to: 'cadastres#update_sicaf',       as: 'update_sicaf'
  get '/update_declaration', to: 'cadastres#update_declaration', as: 'update_declaration'
  get '/update_confirm',     to: 'cadastres#update_confirm',     as: 'update_confirm'

  resources :password_resets, only: %i[new create edit update]

  get 'cities_by_state', to: 'cadastres#cities_by_state', as: 'cities_by_state'


end
