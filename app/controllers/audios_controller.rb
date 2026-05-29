class AudiosController < ApplicationController
  
  def show
    @textbook = Textbook.find(params[:textbook_id])
    @lesson = @textbook.lessons.find_by!(learning_mode: params[:lesson_learning_mode])
    #Textbookモデルでは　has_many :lessons
    @audio = @lesson.audios.find(params[:id])
    #Lessonモデルでは　has_many :audios
    @audios = @lesson.audios
  end

end