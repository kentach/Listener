class BooklistsController < ApplicationController
    before_action :set_textbook, only: :create

  def index
    @booklists = current_user.booklists.includes(:textbook)
    #current_userが持っているbooklistsを取ってくる。そのbooklistに属しているtextbookも一緒に取ってくる。
    # booklistモデルに belong_to :textbookと書いてある
  end
  
  def create
    current_user.booklists.find_or_create_by(textbook: @textbook)
  end

  def destroy
    booklist = current_user.booklists.find(params[:id])
    booklist&.destroy
  end

  private 

  def set_textbook
    @textbook = Textbook.find(params[:textbook_id])
  end

end
