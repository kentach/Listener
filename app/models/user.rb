class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :favorite_audios, through: :favorites, source: :audio
  has_many :booklists, dependent: :destroy
  has_many :saved_textbooks, through: :booklists, source: :textbook
  has_many :learning_records, dependent: :destroy
  has_many :learning_records_audio, through: :learning_records, source: :audio

  def favorite(audio)
    favorite_audios << audio
  end

  def unfavorite(audio)
    favorite_audios.delete(audio)
  end

  def favorite?(audio)
    favorite_audios.include?(audio)
  end

  def completed?(audio)
    learning_records.exists?(audio: audio)
  end

  def progress_for(textbook)
    total_audios =
      Audio.where(
        lesson_id: textbook.lessons.ids
      ).count
    completed_audios =
      learning_records
        .joins(:audio)
        .where(
          audios: {
            lesson_id: textbook.lessons.ids
          }
        )
        .count
    return 0 if total_audios.zero?
    (completed_audios.to_f / total_audios * 100).round
  end

  def last_played_audio
    learning_records.includes(:audio).order(last_played_at: :desc).first&.audio
  end
end
