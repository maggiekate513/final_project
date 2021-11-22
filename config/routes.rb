Rails.application.routes.draw do
  root :to => "meals#index"
  resources :categories
  resources :grocery_stores
  resources :ingredients
  resources :meals
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
