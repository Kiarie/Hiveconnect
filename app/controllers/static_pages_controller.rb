class StaticPagesController < ApplicationController
  def Home
  @micropost = current_user.microposts.build if sign_in?
  @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def Help
  end

end
