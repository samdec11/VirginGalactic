Virgingalactic::Application.routes.draw do

  root :to => 'home#index'
  resources :planes
end
