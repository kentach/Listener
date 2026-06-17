class StaticPagesController < ApplicationController
  def top
    @fiveStage_textbooks = Textbook.where(series: "5ステージ")
    @eigoMimi_textbooks = Textbook.where(series: "英語耳")
    @textbooks = Textbook.all
  end
end
