TechnicalAssistance::Engine.routes.draw do
    root "home#index"
    get 'candidatos', to: 'home#candidates'
    get 'postos', to: 'home#stations'
    get 'melhorias_habitacionais', to: 'home#melhorias'
end
