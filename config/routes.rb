Rails.application.routes.draw do

  resources :migrations
  root to:'home#index'
  resources :rutes
  resources :home
  resources :lokasis
  resources :jalans
  resources :angkutans

  get 'tarif/index'
  get 'rute/index'
  get 'map/index'
  get 'homes/index'
  get 'home/index'
  get 'student/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
