class TextbooksController < ApplicationController
  def show
    @textbook = Textbook.find(params[:id])
    @booklist = current_user.booklists.find_by(textbook: @textbook)
    @progress = current_user.progress_for(@textbook)
  end
end
