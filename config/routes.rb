Crowdfunder::Application.routes.draw do

  delete "/sessions" => "sessions#destroy", :as => "session"
  namespace :my do 
  	resources :projects # => My::ProjectsController
  end
  resources :sessions, :only => [:new, :create]
  resources :users, :except => [:index]
  resources :projects do
  	resources :pledges, :only => [:new, :create]
  end
  root :to => "welcome#index"

end
