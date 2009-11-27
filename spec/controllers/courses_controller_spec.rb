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

    # ..but instead use mocks 
    it "should find all courses" do
      fake_as_authenticated!
      
      # we bypass hitting database and just check that method ".all" gets called
      # and returns mock object defined above
      
      Course.should_receive(:all).and_return([@course_mock])
      
      get :index
    
      assigns(:courses).should == [@course_mock]
    end
    
  end
  
  
  describe "show" do

    it "should find correct course" do       
      fake_as_authenticated!     

      Course.should_receive(:find).with("12").and_return(@course_mock)
      # Rails stack converts integer 12 to "12", as our assertion in above shows
      get :show, :id => 12
      assigns(:course).should == @course_mock
    end
    
  end

end
