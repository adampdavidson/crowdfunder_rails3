Crowdfunder::Application.routes.draw do

  delete "/sessions" => "sessions#destroy", :as => "session"
  resources :sessions, :only => [:new, :create]
  resources :users, :except => [:index]
  resources :projects
  root :to => "welcome#index"

end
