Rails.application.routes.draw do
  # Basic welcome route
  get 'welcome/index'
  root 'welcome#index'
  
  # Registrations routes
  get 'signup', to: 'registrations#new', as: 'signup'
  post 'signup', to: 'registrations#create' # This uses the 'signup' path for consistency
  
  # Sessions routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'sessions' # If you need a path helper, consider using 'create_session'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Verification routes (assumes one to show form, another to submit)
  get 'verification', to: 'registrations#verify', as: 'verification'
  post 'verification', to: 'registrations#check_verification', as: 'check_verification'
  #get '/verification', to: 'users#verification'
  
  # User profile route
  resources :users

  # Merge the 'restaurants' route here
  resources :restaurants

  resources :restaurants do
    post 'create_review', on: :member
  end
  
  
  # Any additional routes can go here...
  resources :pairings 
  get 'pairings/:id/join', to: 'pairings#join', as: 'join_pairing'
end


