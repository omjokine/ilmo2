require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "john",
      :password => "secretret",
      :password_confirmation => "secretret"
    }
    
    @valid_user = User.new(@valid_attributes)
  end

  describe "creation" do
    it "should create a new instance given valid attributes" do
      User.create!(@valid_attributes)
    end
    
    it "should lowercase username" do
       user = User.create!(@valid_attributes.merge({:username => "jOhN"}))
       user.username.should == "john"
    end
  end

  describe "validation" do
    it "should require username to be between 3 and 15 characters" do
      user = User.new(@valid_attributes)
      user.should be_valid
      
      user.username = "ab"
      user.should_not be_valid
      
      user.username = "a"*16
      user.should_not be_valid
    end
    
    it "should have a password" do
      @valid_user.password = ""
      @valid_user.should have(2).errors_on(:password)
    end
    
    it "should require confirmation of password" do
      @valid_user.password_confirmation = ""
      @valid_user.should have(1).error_on(:password)
    end
    
  end
  
end
