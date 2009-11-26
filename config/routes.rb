ActionController::Routing::Routes.draw do |map|
  map.resources :course_exercise_groups

  map.resources :course_instances


  map.root :controller=>:users
 
  map.resources :users

  map.resources :courses

  map.login "/login", :controller=>:sessions, :action=>:create
  map.logout "/logout", :controller=>:sessions, :action=>:destroy

end
