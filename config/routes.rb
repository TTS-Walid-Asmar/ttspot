Rails.application.routes.draw do
  devise_for :users
  resources :cities do
    resources :courses
  end
  resources :offerings
end
