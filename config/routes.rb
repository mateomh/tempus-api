Rails.application.routes.draw do
  resources :tasks
  resources :users, only: [:show, :create]
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
