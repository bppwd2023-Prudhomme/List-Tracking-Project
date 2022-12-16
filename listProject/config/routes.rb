Rails.application.routes.draw do
  get 'groups/addUser'
  get 'lists/shared'
  get 'lists/archive'
  get 'permissions/permisChange'
  get 'page/home'
  resources :groups
  resources :items
  resources :permissions
  resources :sections
  resources :lists
  
  get 'page/home'

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"

  end
  devise_for :users  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "page#home"
end
