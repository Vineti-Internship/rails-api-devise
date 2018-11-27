Rails.application.routes.draw do
  # devise_for :users
  scope 'api' do
    namespace :v1 do
      resources :contacts
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:index, :create, :destroy]
    end
  end
end
