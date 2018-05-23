Main::Engine.routes.draw do

  root 'home#index'


  resources :events, path: 'evento'
  get 'convenios', to: 'home#convenant'
  get 'eventos', to: 'home#event'
  get 'reconhecimento', to: 'home#recognition'

  scope '/habitabrasilia' do
    resources :brasilia_habitation, path: '/'
  end


  resources :posts,                      path: 'postagem'
  resources :pages,                      path: 'pagina'
  resources :galleries,                  path: 'galeria'
  resources :reports,                    path: 'relatorios'
  resources :trading_floors,             path: 'editais' do
    resources :trading_floor_participants, path: 'participantes', as: :participants
  end

  get 'noticias',             to: 'noticias#index'
  get 'assistencia_noticias', to: 'noticias#notice_midia'
  get 'noticias_mobile',      to: 'noticias#mobile'
  get 'galerias',             to: 'galleries#index'
  get 'videos',               to: 'videos#index'
  get 'assistencia_videos',   to: 'videos#video_midia'
  get 'testes',               to: 'galleries#testes'
resources :stations, path: 'assistencia'

  # => Custom pages
  #get 'relatorios',         to: 'custom_pages#relatorios'
  get 'termos_de_uso',           to: 'custom_pages#terms'
  get 'ouvidoria',               to: 'custom_pages#ouvidoria'
  get 'selagem',                 to: 'sealings#index'
  get 'acessoainformacao',       to: 'custom_pages#info'
  get 'portas_abertas',          to: 'custom_pages#portas_abertas'
  get 'passoapasso',             to: 'custom_pages#passoapasso'
  get 'recuperacao_senha',       to: 'custom_pages#recuperacao_senha'
  get 'selagemcrixa_area1',      to: 'custom_pages#selagemcrixa_area1'
  get 'selagemcrixa_area2',      to: 'custom_pages#selagemcrixa_area2'
  get 'selagemcrixa_area3',      to: 'custom_pages#selagemcrixa_area3'
  get 'selagemcrixa_area4',      to: 'custom_pages#selagemcrixa_area4'
  get 'selagemcrixa_area5',      to: 'custom_pages#selagemcrixa_area5'
  get 'selagemcrixa_area6',      to: 'custom_pages#selagemcrixa_area6'
  get 'selagem_crixa',           to: 'custom_pages#selagem_crixa'
  get 'selagem_bonsucesso_area1',to: 'custom_pages#selagem_bonsucesso_area1'
  get 'selagem_bonsucesso_area2',to: 'custom_pages#selagem_bonsucesso_area2'
  get 'selagem_bonsucesso_area3',to: 'custom_pages#selagem_bonsucesso_area3'
  get 'selagem_bonsucesso_area4',to: 'custom_pages#selagem_bonsucesso_area4'
  get 'selagem_bonsucesso',      to: 'custom_pages#selagem_bonsucesso'
  get 'selagem_bananal',      to: 'custom_pages#selagem_bananal'
  get 'selagem_bananal_area1',to: 'custom_pages#selagem_bananal_area1'
  get 'selagem_copaibas',      to: 'custom_pages#selagem_copaibas'
  get 'selagem_copaibas_area1',to: 'custom_pages#selagem_copaibas_area1'
end
