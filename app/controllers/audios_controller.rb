class AudiosController < ApplicationController
  
  def show
    Rails.logger.debug "params = #{params.inspect}"

    @textbook = Textbook.find(params[:textbook_id])
    @lesson = @textbook.lessons.find_by!(
    learning_mode: params[:lesson_learning_mode]
  )
    @audio = @lesson.audios.find(params[:id])
  end

end