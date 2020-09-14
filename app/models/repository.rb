class Repository < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :full_name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  has_many :commits, dependent: :destroy
end
