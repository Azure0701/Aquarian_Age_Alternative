Rails.application.routes.draw do

  get 'introductions/index'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }

  get '/' => 'top#home'
  root 'top#index'
  resources :top, only: [:index]

  resources :users, only: [:edit, :update]
  
  resources :boards do
   resources :comments, only: [:create, :destroy]
  end
end
