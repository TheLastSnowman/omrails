class Build < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
  validates :ship, presence: true
  validates :url, presence: true

  acts_as_votable
end
