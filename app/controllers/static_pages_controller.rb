class StaticPagesController < ApplicationController
  def top
    if user_signed_in?
      render 'top'
    else
      render 'before_login'
    end
  end 
end
