class StaticPagesController < ApplicationController
  def Home
  if sign_in?
  @micropost = current_user.microposts.build if sign_in?
  @feed_items = current_user.feed.paginate(page: params[:page])
  end
  end

  def Help
  end

end
