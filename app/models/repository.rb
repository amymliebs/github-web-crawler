class Repository < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :contributors, presence: true
end
