Rails.application.routes.draw do
  root to: 'pages#home'
  get 'connect', to: 'pages#connect'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resource :profile
  end
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  get 'blog', to: 'pages#blog'
  get 'consult', to: 'pages#consult'
  get 'contract', to: 'pages#contract'
end