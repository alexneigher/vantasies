Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#show"

  resources :photos

  resources :vans

  resources :charges

  get :about, to: "static_pages#about"
end
