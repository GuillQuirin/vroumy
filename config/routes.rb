Rails.application.routes.draw do
  root :to => 'events#index'
  devise_for :utilisateurs
  resources :utilisateurs
  resources :constructeurs
  resources :voitures
  resources :vroumies
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
