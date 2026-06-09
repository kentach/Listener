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
  has_many :eiken_records, dependent: :destroy

  def progress_for(textbook)
    total_audios = Audio.where(lesson_id: textbook.lessons.ids).count # Audioテーブルのlesson_idがtextbookが持っているlessonのidを全て取得
    completed_audios = learning_records.joins(:audio).where(audios: { lesson_id: textbook.lessons.ids }).count
    # learning_recordsには、Audio〇〇の学習記録
    # joinメソッドは、どのAudioの記録かわかるようにlearning_records と audio をつなげる
    return 0 if total_audios.zero?
    (completed_audios.to_f / total_audios * 100).round
    # to_fは、数字を小数（Float）に変換する
    # roundは、四捨五入するメソッド
  end
  
  def progress_message(textbook)
    progress = progress_for(textbook)
    if progress == 100
      "🎉 完璧です！全て完了しました！"
    elsif progress >= 80
      "🔥 素晴らしいです！あと少しで完了です！"
    elsif progress >= 60
      "📈 順調に成長しています。この調子で続けましょう！"
    elsif progress >= 40
      "💪 半分近く達成！引き続き頑張りましょう。"
    elsif progress >= 20
      "🌱 少しずつ進んでいます。毎日の積み重ねが大切です。"
    else
      "📚 まだ始めたばかりです。一歩一歩進みましょう！"
    end
  end

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

  EIKEN_LEVELS = [ "英検5級", "英検4級", "英検3級", "英検準2級", "英検準2級プラス", "英検2級", "英検準1級", "英検1級" ]
end
