Rails.application.routes.draw do
  # get 'events/index'

  resources :events, only: [:index, :show]
  
  root to: 'events#index'
end
