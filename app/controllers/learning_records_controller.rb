class LearningRecordsController < ApplicationController
  before_action :set_audio

  def create
    current_user.learning_records.find_or_create_by(audio: @audio)
    #current_userのlearning_recordsの名からaudio:（条件キー）に合致するaudioを探す。なければ作る。
    respond_to do |format|
      format.turbo_stream
      format.html {redirect_back fallback_location: root_path}
    end
  end

  def destroy
    learning_record = current_user.learning_records.find_by(audio: @audio)
    #current_userのlearning_recordsの中からaudio:（条件キー）に合致するaudioを探してくる。
    learning_record&.destroy
    #もし左がnilでなければ、右側を実行する。もしnilなら何もしません。
  
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end

  private

  def set_audio
    @audio = Audio.find(params[:audio_id])
  end
end
