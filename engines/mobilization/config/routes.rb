Mobilization::Engine.routes.draw do
    root "home#index"
    resources :events
end