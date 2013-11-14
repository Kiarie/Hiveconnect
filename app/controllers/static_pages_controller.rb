class StaticPagesController < ApplicationController
  def Home
  @micropost = current_user.microposts.build if sign_in?
  end

  def Help
  end

end
