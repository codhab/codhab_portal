Rails.application.routes.draw do
  mount Certificate::Engine => "/certificate"
end
