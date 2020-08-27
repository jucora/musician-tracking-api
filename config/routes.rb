Rails.application.routes.draw do
  root to: "static#home"

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]

  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'

  resources :skills, only: [:index, :create, :update]
  resources :measures, only: [:create]

  delete 'skills/destroy/:skill_id', to: 'skills#destroy'
end
