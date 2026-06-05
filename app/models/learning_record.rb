class LearningRecord < ApplicationRecord
  belongs_to :user
  belongs_to :audio
  validates :audio_id,
            uniqueness: { scope: :user_id } # 同じユーザーは同じ音声に対してLearningRecordを1件だけ持つ
end
