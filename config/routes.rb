Rails.application.routes.draw do
  resources :cities do
    resources :courses
  end
  resources :offerings
end
