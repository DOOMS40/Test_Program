Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  get 'projects/index'
  get '/' => 'home#index'
  
  
  resources :users do
    resources :projects
  end 

  resources :projects do
    resources :tasks
  end
 
  resources :tasks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
