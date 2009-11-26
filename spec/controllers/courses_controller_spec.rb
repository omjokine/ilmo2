require 'spec_helper'

describe CoursesController do

  describe "routes" do

    it "should route the root to index" do
      params_from(:get, "/").should == {:controller => "courses", :action => "index"}
    end
      
  end

  
  before(:each) do
     @course_mock = mock_model(Course)
  end
  
  describe "index" do

    # hitting database, this behaviour should be tested at unit tests
    # so we don't want to do this..
    it "should find all courses from db" do
      
      # test-database is empty so we have to create something in it
      3.times {
        Course.create! :name => "Rails and rSpec"
      }
      
      # make get request to application
      get :index
      
      # should assign @courses with 3 objects from database
      assigns(:courses).should have(3).records
    end
    
    # ..but instead use mocks 
    it "should find all courses" do
      # we bypass hitting database and just check that method ".all" gets called
      # and returns mock object defined above
      
      Course.should_receive(:all).and_return([@course_mock])
      
      get :index
    
      assigns(:courses).should == [@course_mock]
    end
    
  end
  
  
  describe "show" do

    it "should find correct course" do       
       # our before filter works also in here!         
       controller.should_receive(:authorize).and_return(true)

       course_mock = mock_model(Course)
       Course.should_receive(:find).with("12").and_return(course_mock)

       # Rails stack converts integer 12 to "12", as our assertion in above shows
       get :show, :id => 12
   
       assigns(:course).should == course_mock
    end
    
  end

end
