Rails.application.routes.draw do

  root 'main/home#index'

  get '/d', to: 'main/home#d' # => direg
  get '/a', to: 'main/home#a' # => pamila
  get '/b', to: 'main/home#b' # => rafael
  get '/e', to: 'main/home#e' # => entidades
  get '/c', to: 'main/home#c' # => Certificados

  get  '/boletos/retorno-externo', to: 'external_invoices#external_return'
  post '/boletos/remessa-externa', to: 'external_invoices#external_remmitance'
  get  '/boletos/arquivo/:file', to: 'external_invoices#external_file'

  get  'recadastramento_portal', to: 'custom_pages#index',  as: :index_recadastre
  get  'recadastramento', to: 'custom_pages#new',     as: :new_recadastre
  post 'recadastramento', to: 'custom_pages#create',  as: :post_recadastre

  get  'lat-lng', to: 'sessions#get_lat_lng',      as: 'session_lat_lng'
  post 'lat-lng', to: 'sessions#get_lat_lng_post', as: 'session_lat_lng_post'
  # get "/assistenciatecnica" => redirect("http://www.codhab.df.gov.br/pagina/31")
  # get "/assistencia_tecnica" => redirect("http://www.codhab.df.gov.br/pagina/31")
  get "previsao-oferta-unidades-habitacionais-2017", to: 'custom_pages#sheet_2017'

  mount Main::Engine                => '/'
  mount Firm::Engine                => '/empresa'
  mount SocialWorkCadastre::Engine  => '/credenciamento'
  mount Concourse::Engine           => '/concursos'
  mount Candidate::Engine           => '/candidato'
  mount Action::Engine              => '/acoesurbanas'
  mount Schedule::Engine            => '/agendamento'
  # mount Assistance::Engine      => '/assistencia_tecnica'
  mount Address::Engine             => '/enderecos'
  mount Regularization::Engine      => '/regularizacao'
  mount Entity::Engine              => '/entidades'
  mount Mobilization::Engine        => '/mobilizacao_social'
  mount Geolocation::Engine         => '/maps'
  mount Person::Engine              => '/gestao_pessoa'
  mount Protocol::Engine            => '/protocolo'
  mount Attendance::Engine          => '/atendimento', as: :attendance
  mount Document::Engine            => '/documento'
  mount SocialWork::Engine          => '/social'
  mount Letter::Engine              => '/cartadeservico'
  mount ExternalFirm::Engine        => '/empresa_externa'
  mount TechnicalAssistance::Engine => '/assistencia_tecnica'
  mount Certificate::Engine         => '/certificado'
  mount Cpl::Engine                 => '/cpl'
  #mount CplConcurrence::Engine      => '/concorrencia'

  mount CplCompetition::Engine      => '/concorrencia-virtual'
end
