Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'

  get 'home/about' => 'home#about'
  resources :books, only: [:create, :index, :show, :update, :edit, :destroy]

  resources :users, only: [:create, :index, :show, :update, :edit, :destroy]

end
