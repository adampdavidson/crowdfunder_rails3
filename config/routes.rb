Crowdfunder::Application.routes.draw do

  resources :users, :except => [:index]
  resources :projects


end
