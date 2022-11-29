Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  get 'users/index'
  match '/users/:username', to: 'users#show', via: 'get'


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }

  resources :events
  
  root to: 'events#index'
end
