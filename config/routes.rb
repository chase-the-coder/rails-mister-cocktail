Rails.application.routes.draw do
  devise_for :users
  resources :cocktails, only: [:index, :new, :show, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  root to: 'pages#home'
end
