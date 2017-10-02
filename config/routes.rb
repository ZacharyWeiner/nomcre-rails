Rails.application.routes.draw do

  resources :locations
  mount ActionCable.server => '/cable'
  resources :collections do
    resources :collection_items
  end
  get '/collection_item/download/:id', to: 'collection_items#download', as:'download'
  resources :chatrooms
  resources :messages
  resources :tasks do
    get '/complete', to: 'tasks#complete', as: 'task_complete'
  end
  resources :schedule_items
  resources :companies
  resources :waitlists

 resources :proposals do
  get '/edit_details', to: 'proposals#edit_details', as: 'edit_details'
  get '/payment', to: 'proposals#payment'
 end

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

  get 'user/:id', to: "users#show"
  get 'adminlte', to:'pages#adminlte'
  resources :charges
  # Application root
  root to: 'application#home'
  # Front routes end
end
