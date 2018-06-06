TechnicalAssistance::Engine.routes.draw do
    root "home#index"
    get 'candidatos', to: 'home#candidates'
    get 'sol_nascente', to: 'home#show_nascente'
    get 'postos', to: 'home#stations'
    get 'melhorias_habitacionais', to: 'home#melhorias'
end
