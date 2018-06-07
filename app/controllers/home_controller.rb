class HomeController < ApplicationController
  def index
  	@home = Post.all.with_attached_images.order(created_at: :desc).limit(10)
  end
end
