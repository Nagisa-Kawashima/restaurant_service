class Public::HomesController < ApplicationController
  def top
    @new_posts = Post.published.order("created_at DESC").first(4)
  end

  def about
  end
end
