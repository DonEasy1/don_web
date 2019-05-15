Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  get 'blog', to: 'pages#blog'
  get 'connect', to: 'pages#connect'
  get 'consult', to: 'pages#consult'
  get 'contract', to: 'pages#contract'
end