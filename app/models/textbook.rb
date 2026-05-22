class Textbook < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true
  validates :series, presence: true
  validates :image, presence: true
end
