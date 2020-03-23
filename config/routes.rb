Rails.application.routes.draw do
  devise_for :users
  resources :users, except: %i[index new create]
  resources :cocktails do
    resources :doses, only: [:new,:update, :edit, :create]
  end
  resources :doses, only: [:destroy]
  root to: 'pages#home'
end
