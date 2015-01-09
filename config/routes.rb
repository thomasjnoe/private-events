Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
