TimeTracker::Application.routes.draw do

  devise_for :users, :path => :account, :controllers => {:registrations => 'registrations'}

  resources :works
  resources :versions
  resources :tickets
  resources :ticket_statuses
  resources :ticket_priorities
  resources :ticket_comments
  resources :ticket_categories
  resources :projects_users
  resources :contacts
  resources :clients
  resources :users_teams
  resources :teams
  resources :projects
  resources :roles
  resources :users
  resources :tasks

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
