class TextbooksController < ApplicationController
  
  def show
    @textbook = Textbook.find(params[:id])
  end

end
