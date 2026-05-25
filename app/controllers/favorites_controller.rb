class FavoritesController < ApplicationController
  before_action :set_audio, except: :index

  def index
    @favorite_audios = current_user.favorite_audios
  end

  def create
    current_user.favorites.find_or_create_by(audio: @audio)
    #userモデルに has_many :favoritesと書いているからcurrent_user.favorites
    #find_or_create_byメソッドを使って、「audio に @audio を入れる」

    flash.now[:notice] = "マイリストに追加しました。"

    respond_to do |format|
      format.turbo_stream
      format.html {redirect_back fallback_location: favorites_path}
    end
    
  end

  def destroy
    favorite = current_user.favorites.find_by(audio: @audio)
    favorite&.destroy
  
    respond_to do |format|
      format.turbo_stream do
        flash.now[:danger] = "マイリストから削除しました。"
      end
  
      format.html do
        redirect_back(
          fallback_location: favorites_path,
          danger: "マイリストから削除しました。"
        )
      end
    end
  end

  private

  def set_audio
    @audio = Audio.find(params[:audio_id])
  end
end
