Rails.application.routes.draw do
  resources :constructeurs
  resources :voitures
	root :to => 'vroumy#index'
  resources :utilisateurs
  resources :vroumies
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
