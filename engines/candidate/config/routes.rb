Candidate::Engine.routes.draw do

  get   'pesquisa-cpf', to: 'cadastres#find_new'
  post  'pesquisa-cpf', to: 'cadastres#find_show'

  get    'emitir-boleto', to: 'billets#new', as: 'new_billet'
  post   'emitir-boleto', to: 'billets#create', as: 'billets'

  get '1000_candidatos', to: 'geolocations#candidates_zone_one'

  get 'ocurrences', to: 'cadastres#ocurrences'
  get 'indication_explanation', to: 'cadastres#indication_explanation'
  
  resources :lists, path: 'listas'

  resources :cadastres, path: 'cadastro', only: :show
  resources :positions, path: 'posicoes' do
    get 'event'
  end

  resources :attendances, path: 'atendimentos' do
    collection do
      get 'ficha_cadastral', to: 'attendances#print_cadastre'
      get 'ficha_checklist', to: 'attendances#print_checklist'
      get 'folha_rosto',     to: 'attendances#print_face'
    end
  end

  namespace :restrict_area, path: 'area_restrita' do

    root 'dashboard#index'

    get 'simulator', to: 'dashboard#simulator'

    resources :askings, path: 'perguntas', only: [:new, :create]
    resources :questions, path: 'questionamento' do
      collection do
        post 'question_create'
        get  'question_new'
        get 'question_closed'
      end
    end

    resources :manifestations, path: 'manifestacao', only: [:new, :index, :destroy]

    resources :tickets
    resources :schedules, path: 'agendamentos'
    resources :sessions,  path: 'acesso' do
      collection do
        delete 'logout'
      end
    end

    resources :cadastres, path: 'cadastro', only: [:edit, :update]

  end

  resources :indications, path: 'indicados' do
    collection do
      get 'steps'
      get 'allotments'
    end
  end

  resources :remember_passwords, path: 'lembrar-senha' do
    collection do
      get   'question_one'
      post  'update_question_one'

      get   'question_two'
      post  'update_question_two'

      get   'question_three'
      post  'update_question_three'

      get   'question_four'
      post  'update_question_four'

      get   'question_five'
      post  'update_question_five'

      post  'update_password'
    end
  end
end
