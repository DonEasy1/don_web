Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'blog', to: 'pages#blog'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  get 'connect', to: 'pages#connect'
  get 'consult', to: 'pages#consult'
  get 'contract', to: 'pages#contract'
end