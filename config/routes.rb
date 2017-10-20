Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "welcome#show"

  resources :photos

  resources :vans

  resources :charges

  resources :messages

  resources :user do
    resources :vans, only: [:index, :edit, :update], controller: 'users/vans'
  end

  get :about, to: "static_pages#about"
end
