class Schedule < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :content
  
  validates :start_time, presence: true
  validates :assisted, presence: true
  validates :content_id, numericality: { other_than: 1, message: "can't be blank" }

end
