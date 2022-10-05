Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apartments, only: [:index, :create, :update, :destroy]
  resources :tenants, only: [:index, :create, :update, :destroy]
  resources :leases, only: [:create, :destroy]
end
