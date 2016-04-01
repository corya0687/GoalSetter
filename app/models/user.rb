class User < ActiveRecord::Base
  has_secure_password
  has_many :plans, through: :goals
  has_many :goals, through: :users_goals
  validates_presence_of :username, :email, :password_digest
end
