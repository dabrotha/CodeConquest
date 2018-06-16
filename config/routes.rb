Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'welcome#index', as: 'root'
  
  #Drill Routes
  
  resources :drill_groups
  resources :drills
  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :destroy, :create]

end



