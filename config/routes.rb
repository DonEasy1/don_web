Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  get 'blog', to: 'pages#blog'
  get 'connect', to: 'pages#connect'
  get 'consult', to: 'pages#consult'
  get 'contract', to: 'pages#contract'
end