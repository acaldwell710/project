Rails.application.routes.draw do


  devise_for :users#, controllers: {registrations: "registrations"}

  # devise_scope :user do
  #   get "register", to: "devise/registrations#new"
  # end
  resources :wikis
  resources :subscribers
  get 'new_user_session' => 'devise/sessions#new'

  get 'new_user_password' => 'devise/password#new'
  get 'edit_user_password' => 'devise/passwords#edit'

  get 'cancel_user_registration' => 'registrations#cancel'
  get 'new_user_registration' => 'registrations#new'
  get 'edit_user_registration' => 'registrations#edit'
  get 'edit_user_registration' => 'registrations#edit'
  get 'register' => 'devise/registrations#new'

  get 'wikis' => 'wikis#index'
  get 'new_wiki' => 'wikis#new'
  get 'edit_wiki' => 'wikis#edit'
  get 'wiki' => 'wikis#show'

  get 'subscribers' => 'subscribers#index'
  get 'new_subscriber' => 'subscribers#new'
  get 'edit_subscriber' => 'subscribers#edit'
  get 'subscriber' => 'subscribers#show'

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
