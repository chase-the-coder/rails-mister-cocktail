Rails.application.routes.draw do
  resources :cocktail, only: [:index, :new, :show, :create] do
    resources :doses, only: [:new, :create, :delete]
  end
end
