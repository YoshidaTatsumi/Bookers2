Rails.application.routes.draw do
  root 'users#top'
  get 'home/about' => 'users#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]
end
