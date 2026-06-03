class Lesson < ApplicationRecord
  belongs_to :textbook
  has_many :audios, dependent: :destroy
  
  validates :learning_mode, presence: true

  enum learning_mode: {
    reading: "reading",
    listening: "listening",
  }

end
