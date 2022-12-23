class Public::HomesController < ApplicationController
  def top
    @new_posts = Post.published.order("created_at DESC").limit(4)
  end

  def about
  end


  def confirm
  end

end
