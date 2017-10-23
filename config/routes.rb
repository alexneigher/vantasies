Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :vans do
    get 'for-sale', to: 'for_sale#index'
    get 'inspiration', to: 'inspiration#index'
  end

  root "welcome#show"

  resources :photos

  resources :vans do
    resources :photos, controller: 'vans/photos'
    put :reorder_photos, to: 'vans/photos#reorder_photos'
  end

  resources :charges #when a user sells a 1-off van
  resources :customers #when a company gets a subscription

  resources :messages

  resources :user do
    resources :vans, only: [:index, :edit, :update, :destroy], controller: 'users/vans'
  end

  resources :companies do
    resources :vans, controller: 'companies/vans'
    resources :photos, controller: 'companies/photos'
    put :reorder_photos, to: 'companies/photos#reorder_photos'
  end

  get :about, to: "static_pages#about"


end
