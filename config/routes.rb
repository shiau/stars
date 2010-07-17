ActionController::Routing::Routes.draw do |map|
  map.login  'login',  :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.newuser 'newuser', :controller => 'users', :action => 'new'

  map.resources :stars
  map.resources :user_sessions
  map.resources :users

  map.root      :users
end
