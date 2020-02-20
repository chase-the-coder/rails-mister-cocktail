Rails.application.routes.draw do
  resources :cocktails, only: [:index, :new, :show, :create] do
    resources :doses, only: [:new, :create, :delete]
  end
end
