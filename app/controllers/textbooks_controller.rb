class TextbooksController < ApplicationController
  
  def show
    @textbook = Textbook.find(params[:id])
    @progress = current_user.progress_for(@textbook)
  end
end
