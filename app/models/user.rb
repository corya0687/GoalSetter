class User < ActiveRecord::Base
  has_secure_password
  has_many :users_goals
  has_many :goals, through: :users_goals
  has_many :plans, through: :goals
  validates_presence_of :username, :email, :password_digest
  include Slugifiable::Instance
extend Slugifiable::Class
end
