Rails.application.routes.draw do

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }

  resources :events
  
  root to: 'events#index'
end
