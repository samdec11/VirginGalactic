Virgingalactic::Application.routes.draw do
  root :to => 'home#index'

  resources :users, :only => [:new, :create]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :planes, except: [:destroy, :update]
  resources :flights, except: [:destroy,:show]

  get "/search" => 'flights#search', :as => :search
  get "/search/results" => 'flights#results', :as => :search_results

end
