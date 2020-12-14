Rails.application.routes.draw do
  resources :tasks, only: [:show, :create]
  resources :users, only: [:show, :create]
  resources :categories, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Custom Routes
end
