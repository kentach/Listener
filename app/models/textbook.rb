class Textbook < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true
  validates :series, presence: true
  validates :image, presence: true

  has_many :lessons, dependent: :destroy
  has_many :audios, dependent: :destroy

  has_many :booklists, dependent: :destroy
end
