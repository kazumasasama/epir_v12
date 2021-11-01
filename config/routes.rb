Rails.application.routes.draw do
  namespace :api do
    # resources :admins, only: [:index, :show]
    resources :users, only: [:index, :show]
  end
end
