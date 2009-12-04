class Role < ActiveRecord::Base
  
  has_many :rights
  has_many :users, :through => :rights
  
  validates_length_of :name, :in => 1..255
  validates_uniqueness_of :name
  
  
  def self.admin_role
    find_by_name("admin")
  end
end
