class User < ActiveRecord::Base
  require 'digest/sha1'

  validates_length_of :username, :in => 3..15
  validates_length_of :name, :in => 3..50, :allow_blank => true
  
  validates_length_of :password, :in => 5..30, :allow_blank => true, :on => :update
  validates_length_of :password, :in => 5..30, :on => :create
  validates_confirmation_of :password
  
  validates_length_of :student_number, :is => 9, :allow_blank => true
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => true

  #paperclip
  has_attached_file :avatar, :default_url => '/images/user_avatars/missing.jpg'
 
  has_many :registrations
  has_many :exercise_groups, :through => :registrations

  has_many :rights
  has_many :roles, :through => :rights

  attr_accessor :password, :password_confirmation


  before_save :hash_password, :downcase_username
  after_create :add_newsfeed_event
  
  def self.authenticate(username, password)
    user = User.find_by_username(username)
    
    if user && user.hashed_password == hash_plaintext_password(password)
      return user
    else 
      return nil
     end 
  end
  
  protected
  
  def validate
    unless student_number.blank?
      errors.add(:studentnumber, "does not start with zero") unless student_number.starts_with? "0"
    end
  end
  
  private
  
  def hash_password
    return if self.password.blank?
    self.hashed_password = User.hash_plaintext_password(self.password)
  end

  def downcase_username
    self.username.downcase!
  end
  
  def self.hash_plaintext_password(password)
    Digest::SHA1.hexdigest(password)
  end
  
  def add_newsfeed_event
    Newsfeed.user_created(self)
  end

end
