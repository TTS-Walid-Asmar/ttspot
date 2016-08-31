Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :instructors, skip: :registrations
  devise_for :students, skip: [:sessions, :invitations]
  resources :cities
  resources :registrations, only: [:create]
  resources :courses, shallow: true do
    resources :lessons do
      resources :homeworks, only: [:create, :update, :destroy]
    end
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }, skip: [:invitations, :registrations]


  resources :courses do
    devise_for :students, only: :invitations, controllers: {invitations: 'invitations'}
  end

  resources :offerings
end
