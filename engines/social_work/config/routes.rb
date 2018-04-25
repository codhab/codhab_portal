SocialWork::Engine.routes.draw do

  get     'new_authorization',  path: 'acesso', to: 'authorization#new',      as: 'new_authorization'
  post    'create_authorization',  path: 'acesso', to: 'authorization#create',   as: 'authorization'
  delete  'destroy_authorization',  path: 'acesso', to: 'authorization#destroy',  as: 'destroy_authorization'

  resources :dashboard

  resources :candidates, path: 'candidatos' do
    resources :dependents, path: 'dependentes'
    resources :spouses, path: 'conjuges'
    resources :document_uploads, path: 'documentos'
    resources :answers, path: 'respostas'
    resources :interactions, path: 'interacoes'
  end

  get 'finalize_dependent', to: 'dependents#finalize_dependent',       as: 'finalize_dependent'
  get 'finalize_document',  to: 'document_uploads#finalize_document',  as: 'finalize_document'

  resources :candidate_schedules, path: 'agendados' do
    resources :agenda_interactions
  end

  resources :company_users, path: 'usuarios'
  resources :executor_companies, path: 'executora'

end
