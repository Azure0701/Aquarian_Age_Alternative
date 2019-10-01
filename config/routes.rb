Rails.application.routes.draw do

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

  resources :introductions do
    collection do
      get :summary
      get :story
      get :play
      get :play_buystart
      get :play_rule
      get :play_card
      get :play_gamen
      get :play_operation
      get :play_avatar
      get :mode
      get :point
      get :point_skill
      get :point_alteration
      get :point_battlesense
      get :point_technique
      get :point_deckmake
    end
  end

end
