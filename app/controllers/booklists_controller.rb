class BooklistsController < ApplicationController

  def index
    @booklists = current_user.booklists.includes(:textbook)
    #current_userが持っているbooklistsを取ってくる。そのbooklistに属しているtextbookも一緒に取ってくる。
    # booklistモデルに belong_to :textbookと書いてある
  end
  
  def create
    textbook = Textbook.find(params[:textbook_id])
    current_user.booklists.find_or_create_by(textbook: textbook)
    @textbook = textbook
  end
  
  def destroy
    booklist = current_user.booklists.find(params[:id])
    @textbook = booklist.textbook
    booklist.destroy
  end

end
