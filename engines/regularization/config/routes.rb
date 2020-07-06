Regularization::Engine.routes.draw do
  root 'home#index'

  get   '/pesquisa-cpf',  to: 'cadastres#find_candidate', as: 'find_candidate'
  post  '/pesquisa-cpf',  to: 'cadastres#show_candidate', as: 'show_candidate'

  resources :lists, path: 'listas'
  resources :requests, path: 'requerimento'
  resources :cadastres, path: 'cadastro'
  resources :solicitations, path: 'solicitacoes'

=begin
  resources :requeriments, path: 'requerimentos' do
    collection do
      get   '/address', path: 'endereco', to: 'requeriments#new_address', as: 'new_address'
      post  '/address', path: 'endereco', to: 'requeriments#set_address', as: 'set_address'
      get   '/success', path: 'sucesso',  to: 'requeriments#success',     as: 'success'
    end
  end
=end

  resources :itapoa_regularizations, path: 'regularizacao-itapoa' do
    collection do
      resources :sessions, path: 'acesso', controller: :itapoa_regularization_sessions, as: :itapoa_regularization_sessions
      get 'get_iptu_code', as: :get_iptu_code
    end

  end

  namespace :candidate, path: 'candidato' do
=begin
    resources :requeriments,  path: 'requerimentos' do
      collection do
        get '/verification',  path: 'verificacao', to: 'requeriments#verification', as: 'verification'
        post '/verification', path: 'verificacao', to: 'requeriments#validate_verification', as: 'validate_verification'
      end
    end
=end

    resources :schedules, path: 'agendamentos' do
      collection do
        get '/verification', path: 'verificacao', to: 'schedules#verification', as: 'verification'
      end
    end
  end

end
