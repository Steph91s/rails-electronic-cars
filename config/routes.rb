Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:index, :show]
end
