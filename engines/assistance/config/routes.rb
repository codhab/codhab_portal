Assistance::Engine.routes.draw do
  root 'home#index'
  get 'projetonamedida', to: 'home#medida'
  get 'melhoriashabitacionais', to: 'home#melhorias'
  get 'contato', to: 'home#contato'
  get 'quemsomos', to: 'home#quemsomos'
  get 'acoesurbanas', to: 'home#acoesurbanas'
end
