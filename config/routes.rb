Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :cities

  resources :courses, shallow: true do
    resources :lessons
  end

  resources :offerings
end
