class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_audios, through: :favorites, source: :audio

  def favorite(audio)
    favorite_audios << audio
  end

  def unfavorite(audio)
    favorite_audios.delete(audio)
  end

  def favorite?(audio)
    favorite_audios.include?(audio)
  end

end
