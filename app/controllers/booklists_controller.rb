class BooklistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_booklists = current_user.booklists.includes(:textbook)
    #current_userが持っているbooklistsを取ってくる。そのbooklistに属しているtextbookも一緒に取ってくる。
    # booklistモデルに belong_to :textbookと書いてある
  end
  
  def create
    @textbook = Textbook.find(params[:textbook_id])
    # どのテキストブックに対して、ブックリストを作るかを指定する。
    @booklist = current_user.booklists.find_or_create_by(textbook: @textbook)
    # find_by(カラム名: 値)で条件に一致する1件を取得し、あれば作らないしなければ作る。
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: textbook_path(@textbook) }
    end
  end
  
  def destroy
    booklist = current_user.booklists.find(params[:id])
    # 削除するのはbooklist。
    booklist.destroy
    @textbook = booklist.textbook

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: textbook_path(@textbook) }
    end
  end
end
