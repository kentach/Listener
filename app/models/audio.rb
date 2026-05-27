class Audio < ApplicationRecord
  belongs_to :lesson

  has_many :favorites, dependent: :destroy
  has_many :favorites_by_user, through: :favorites, source: :user

  has_many :learning_records, dependent: :destroy
  has_many :learning_logs, through: :learning_records, source: :user
end
