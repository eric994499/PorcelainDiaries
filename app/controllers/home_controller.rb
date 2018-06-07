class HomeController < ApplicationController
  def index
  	@home = Post.all.with_attached_images.order(created_at: :desc).limit(10)
  	@oldest = Post.all.with_attached_images.order(created_at: :asc).limit(10)
  end
end
