Rails.application.routes.draw do
  mount Letter::Engine => "/letter"
end
