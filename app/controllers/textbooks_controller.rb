class TextbooksController < ApplicationController
  def show
    @textbook = Textbook.find(params[:id])
    @progress = current_user.progress_for(@textbook)
    @booklist = current_user.booklists.find_by(textbook: @textbook)
  end
end
