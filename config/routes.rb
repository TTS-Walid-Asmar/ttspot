Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :cities


  resources :courses, shallow: true do
    resources :lessons do
      resources :homeworks, only: [:create, :update, :destroy]
    end
  end

  resources :offerings
end
