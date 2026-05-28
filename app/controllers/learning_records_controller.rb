class LearningRecordsController < ApplicationController
  before_action :set_audio

  def create
    current_user.learning_records.find_or_create_by(audio: @audio)
    respond_to do |format|
      format.turbo_stream
      format.html {redirect_back fallback_location: root_path}
    end
  end

  def destroy
    learning_record = current_user.learning_records.find_by(audio: @audio)
    learning_record&.destroy
  
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
