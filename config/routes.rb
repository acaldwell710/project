Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}

  devise_scope :user do
    get "register", to: "devise/registrations#new"
  end
  resources :wikis
  resources :subscribers

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
