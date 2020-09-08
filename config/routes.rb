Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  	
  end
  resources :users do
  	member do
  	  get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'

end