ActionController::Routing::Routes.draw do |map|
  map.resources :course_exercise_groups

  map.resources :course_instances



 
  map.resources :users
  map.resources :courses
  
  map.resource :session
  
  map.login "/login", :controller=>:users, :action=>:index
  map.logout "/logout", :controller=>:sessions, :action=>:destroy

  map.root :controller => :courses 
end
