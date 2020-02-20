Rails.application.routes.draw do
  resources :cocktails, only: [:index, :new, :show, :create] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
end
