class FavoritesController < ApplicationController
  before_action :set_audio, except: :index
  before_action :authenticate_user!

  def index
    @favorite_audios = current_user.favorite_audios
    # userモデルにhas_many: favorite_audiosと書いてある。
  end

  def create
    current_user.favorites.find_or_create_by(audio: @audio)
    # userモデルに has_many :favoritesと書いているからcurrent_user.favorites
    # find_or_create_byメソッドを使って、「audio に @audio を入れる」
    # お気に入りにするのはaudioだからね。

    respond_to do |format|
      format.turbo_stream
      format.html {redirect_back fallback_location: textbook_lesson_path(@textbook, @lesson)}
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(audio: @audio)
    favorite&.destroy
  
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: textbook_lesson_path(@textbook, @lesson) }
    end
  end

  private

  def set_audio
    @audio = Audio.find(params[:audio_id])
    @lesson = @audio.lesson
    @textbook = @lesson.textbook
  end
end
