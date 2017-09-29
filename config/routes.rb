Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :collections do
    resources :collection_items
  end
  get '/collection_item/download/:id', to: 'collection_items#download', as:'download'
  resources :chatrooms
  resources :messages
  resources :tasks
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
  resources :charges
  # Application root
  root to: 'application#home'
  # Front routes end
end
