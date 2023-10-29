Rails.application.routes.draw do
  # Registrations routes
  get 'signup', to: 'registrations#new', as: 'signup'
  post 'registrations', to: 'registrations#create'

  # Sessions routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Other routes can go here...
  get 'registrations/new', to: 'registrations#new', as: 'new_registration'
  post 'registrations', to: 'registrations#create'

  get 'verification', to: 'registrations#verify', as: 'verification'
  post 'check_verification', to: 'registrations#verify', as: 'check_verification'

end

