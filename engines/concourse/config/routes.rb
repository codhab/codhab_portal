Concourse::Engine.routes.draw do
  default_url_options :host => "localhost:3000" if Rails.env.development? || Rails.env.test?
  default_url_options :host => "www.codhab.df.gov.br"  if Rails.env.production?

  get     'new_authorization',     path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
  post    'create_authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  delete  'destroy_authorization', path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

  resources :external_consults

  resources :certificates, path: 'certificados'

  resources :projects, path: '/' do

    resources :resources, path: 'recursos'

    get 'result', path: 'resultado', to: 'projects#result'
    get 'all_projects', path: 'todos_projetos', to: 'projects#all_projects'

    namespace :subscribe_candidate, path: 'inscricao' do
      root "candidates#index"

      resources :candidates, path: 'candidato' do
        get 'sucesso'
      end

      resources :remembers, path: 'lembrar' do
        get 'token', path: 'enviar'
      end

      resources :passwords, path: 'senha' do
        collection do
          get 'success', path: 'sucesso'
        end
      end
    end

    namespace :restrict, path: 'restrito' do
      get '/', to: 'sessions#new'

      resources :candidates, path: 'candidato' do
        collection do
          get 'logout', as: 'logout'
          get 'bank_slip', path: 'boleto', as: 'bankslip'
        end
      end
      resources :passwords, path: 'senha', only: [:edit, :update]
      resources :sessions,  path: 'acesso'
      resources :participations, path: 'participacao'
    end

    resources :pages,           path: '/pagina'
    resources :consults,        path: '/consultas'

  end


end