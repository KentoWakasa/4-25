Rails.application.routes.draw do
  resources :books

  root to: "home#top"
  get 'home/about' => 'home#about', as: 'about'

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
