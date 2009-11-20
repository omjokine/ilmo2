require 'digest/sha1'

class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  def self.authenticate(username, password)
    u = User.find_by_username(username)
    
    if u && u.hashed_password == crypt_password(password)
      return u
    else 
      return nil
     end 
  end
  
  def self.crypt_password(password)
    Digest::SHA1.hexdigest(password)
  end

end
