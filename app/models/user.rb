class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password

  validates_presence_of :first_name, :last_name, :email
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email

  has_many :projects
end
