class StaticPagesController < ApplicationController
  def top
    @ontre_textbooks = Textbook.where(series: '音トレ')
    @rhythmas_textbooks = Textbook.where(series: 'リズマス')

    if user_signed_in?
      render 'top'
    else
      render 'before_login'
    end
  end 
end
