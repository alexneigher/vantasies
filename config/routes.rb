Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "welcome#show"

  resources :photos

  resources :vans do
    resources :photos, controller: 'vans/photos'
    put :reorder_photos, to: 'vans/photos#reorder_photos'
  end

  resources :charges

  resources :messages

  resources :user do
    resources :vans, only: [:index, :edit, :update, :destroy], controller: 'users/vans'
  end

  resources :companies

  get :about, to: "static_pages#about"
end
