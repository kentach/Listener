class LessonsController < ApplicationController

  def show
    @textbook = Textbook.find(params[:textbook_id])
    @lesson = @textbook.lessons.find_by!(learning_mode: params[:learning_mode])
    @audios = @lesson.audios
  end
end