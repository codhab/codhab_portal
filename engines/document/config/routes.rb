Document::Engine.routes.draw do
  resources :allotments do
    resources :data_prints
    resources :data_print_files
  end

  get 'validate',         to: 'allotments#validate',          as: 'validate'
  get 'document',         to: 'allotments#document',          as: 'document'

  get 'print_one',        to: 'allotments#print_one',        as: 'print_one'
  get 'print_two',        to: 'allotments#print_two',        as: 'print_two'
  get 'print_three',      to: 'allotments#print_three',      as: 'print_three'
  get 'print_correction', to: 'allotments#print_correction', as: 'print_correction'

end
