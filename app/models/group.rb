class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy 
  has_many :users, through: :group_users
  has_many :schedules
  
  accepts_nested_attributes_for :group_users
  validates :name, presence: true
end
