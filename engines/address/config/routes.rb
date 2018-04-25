Address::Engine.routes.draw do
  resources :documents, path: 'documentos'

  get   '/validate', to: 'documents#validate',             as: 'validate'
  post  '/validate_show', to: 'documents#validate_show',  as: 'validate_show'
  get   '/occupation',     to: 'documents#occupation',     as: 'occupation'
  get   '/donate_unit',    to: 'documents#donate_unit',    as: 'donate_unit'

  get   '/validate_doc',       to: 'documents#validate_doc',       as: 'validate_doc'
  post  '/validate_doc_show', to: 'documents#validate_doc_show',  as: 'validate_doc_show'

  get   '/description', to: 'documents#description', as: 'description'
end
