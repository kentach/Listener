class StaticPagesController < ApplicationController
  def top
    @fiveStage_textbooks = Textbook.where(series: "5ステージ")
    @textbooks = Textbook.all
  end
end
