class EikenRecord < ApplicationRecord
  belongs_to :user

  validates :exam_date, presence: :true
  validates :level, presence: :true
  validates :passed, presence: :true

  def total_score
    [ speaking_score, reading_score, listening_score, writing_score ].compact.sum
  end
end
