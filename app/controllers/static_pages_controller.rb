class StaticPagesController < ApplicationController
  def top
    @ontre_textbooks = Textbook.where(series: "音トレ")
    @rhythmas_textbooks = Textbook.where(series: "リズマス")
  end
end
