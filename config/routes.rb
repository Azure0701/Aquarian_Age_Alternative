Rails.application.routes.draw do
  get '/' => 'top#home'

  resources :top, only: [:index]
    
end
