class LessonsController < ApplicationController

  def show
    @textbook = Textbook.find(params[:textbook_id]) 
    # textbook/:textbook_id/から渡ってくるからparams[:textbook_id]にする

    @lesson = @textbook.lessons.find_by!(learning_mode: params[:learning_mode])
    #textbookモデルにhas_many :lessonsと書いているので@textbook.lessonsと書くことができる
    # それをfind_by!メソッドで検索
    
    @audios = @lesson.audios
    #lessonモデルにhas_many :audiosと書いているので  @audios = @lesson.audiosと書くことができる
  end
end