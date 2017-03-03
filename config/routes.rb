Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :comments, only: [:create, :new, :edit, :update, :destroy]
  resources :answers, only: [:create, :new, :edit, :update, :destroy]
  resources :questions
  resources :votes, only:[:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
