class LessonsController < ApplicationController

  def show
    @textbook = Textbook.find(params[:textbook_id]) 
    # textbook/:textbook_id/から渡ってくるからparams[:textbook_id]にする

    @lesson = @textbook.lessons.find_by(learning_mode: params[:learning_mode])
    #textbookモデルにhas_many :lessonsと書いているので@textbook.lessonsと書くことができる
    # それをfind_by!メソッドで検索
    # find_byメソッドはデータがなければnilを返す。find_by!データがなかったらエラーを返す。
    
    @audios = @lesson&.audios || []
    #&.これはボッチ演算子。@lessonがnilじゃなかったらaudiosを呼ぶ
    # 左がtrueであれば左を返す。左がfalseであれば右を返す。
    #lessonモデルにhas_many :audiosと書いているので  @audios = @lesson.audiosと書くことができる
  end
end