class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         authentication_keys: [ :student_id ] # Userだけstudent_idを使う

  validates :student_id, presence: true, uniqueness: true
  validates :eiken_level, presence: true
  validates :name, presence: :true

  validate :student_id_must_be_allowed
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_many :favorites, dependent: :destroy
  has_many :favorite_audios, through: :favorites, source: :audio
  has_many :booklists, dependent: :destroy
  has_many :saved_textbooks, through: :booklists, source: :textbook
  has_many :learning_records, dependent: :destroy
  has_many :learning_records_audio, through: :learning_records, source: :audio

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

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
    total_audios = Audio.where(lesson_id: textbook.lessons.ids).count
    completed_audios = learning_records.joins(:audio).where(audios: { lesson_id: textbook.lessons.ids }).count
    return 0 if total_audios.zero?
    (completed_audios.to_f / total_audios * 100).round
  end

  def student_id_must_be_allowed
    unless AllowedStudent.exists?(student_id: student_id)
      errors.add(:student_id, "は登録が許可されていません")
    end
  end

  def active_for_authentication?
    super && AllowedStudent.exists?(student_id: student_id)
  end

  def inactive_message
    AllowedStudent.exists?(student_id: student_id) ? super : :not_allowed
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id student_id name eiken_level created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
