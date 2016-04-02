class Goal < ActiveRecord::Base
  has_many :users_goals
  has_many :users, through: :users_goals
  has_many :plans
  validates_presence_of :name, :description, :deadline
  include Slugifiable::Instance
extend Slugifiable::Class
end
