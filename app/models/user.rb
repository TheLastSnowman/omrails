class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :builds
  has_many :mwo_builds

  validates :username, presence: true, uniqueness: true

  acts_as_followable
  acts_as_follower
  acts_as_voter
end
