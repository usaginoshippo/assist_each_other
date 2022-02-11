class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schedules
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  validates :assist, inclusion: [true, false]
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 6 }
end
