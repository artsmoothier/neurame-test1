class SmoothieController < ApplicationController
  def mix
	@posts = Post.all
  end
end
