Rails.application.routes.draw do
  resources :modeles
  root :to => 'homepage#index'
  resources :homepage
  devise_for :utilisateurs
  resources :utilisateurs
  resources :constructeurs
  resources :voitures
  resources :categories
  resources :events
  resources :events do
  	member do
  	  get 'join_utilisateur'
  	end
  end
  resources :utilisateurs do
    member do
      get 'change_role'
    end
  end
  get '*path' => redirect { |p, req| req.flash[:notice] = "Il semblerait que la page suivante n'existe pas : #{p[:a]}"; '/' }
end
