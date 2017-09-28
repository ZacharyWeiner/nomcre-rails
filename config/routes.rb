Rails.application.routes.draw do
  resources :schedule_items
  resources :companies
  resources :waitlists
  # Back admin routes start
  namespace :admin do
    resources :users

    # Admin root
    root to: 'application#index'
  end
  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }


  get 'adminlte', to:'pages#adminlte'

  # Application root
  root to: 'application#home'
  # Front routes end
end
