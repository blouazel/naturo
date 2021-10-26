Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/services', to: 'pages#services'
  get '/contact', to: 'pages#contact'
  post "send_contact" => "pages#send_contact"
  resources :users
  resources :articles
  resources :categories
  resources :subcategories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
