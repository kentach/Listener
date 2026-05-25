class Audio < ApplicationRecord
  belongs_to :lesson

  has_many :favorites, dependent: :destroy
  has_many :favorites_by_user, through: :favorites, source: :user
end
