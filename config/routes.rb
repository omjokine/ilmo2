ActionController::Routing::Routes.draw do |map|
#  map.resources :course_exercise_groups

#  map.resources :course_instances

  map.resource :session
  
  map.login "/login", :controller=>:users, :action=>:index
  map.logout "/logout", :controller=>:sessions, :action=>:destroy

  map.resources :users
#  map.resources :courses
  
  map.resources :courses do |course|
    course.resources :course_instances do |course_instance|
      course_instance.resources :exercise_groups
    end
  end

  map.root :controller => :courses 

end
