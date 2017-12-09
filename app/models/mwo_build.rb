class MwoBuild < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :user, presence: true
  validates :mech, presence: true
  validates :url, presence: true
end
