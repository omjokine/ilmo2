ActionController::Routing::Routes.draw do |map|


  map.resource :session
  map.resources :users 
  
  map.resources :courses do |course|
    course.resources :course_instances do |course_instance|
      course_instance.resources :exercise_groups do |exercise_group|
        exercise_group.registration "/registration", :controller => :exercise_groups, :action => :registration
      end
    end
  end

  map.namespace(:admin) do |admin|
    admin.resources :users, :active_scaffold => true
    admin.resources :courses, :active_scaffold => true
    admin.resources :course_instances, :active_scaffold => true
    admin.resources :exercise_groups, :active_scaffold => true
  end
  
  map.resource :admin, :controller => :admin
  
  map.connect '/feed', :controller => :newsfeeds, :action => :feed
  
  map.login "/login", :controller=>:users, :action=>:index
  map.logout "/logout", :controller=>:sessions, :action=>:destroy

  map.root :controller => :courses 

end
