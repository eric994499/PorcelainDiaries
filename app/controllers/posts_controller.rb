class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]
  impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]
  # GET /posts
  # GET /posts.json
  def index
    @posts = if params[:search] && params[:search] != ''
      Post.where('content OR title LIKE ?', "%#{params[:search]}%").order(created_at: :desc)
    else
      Post.all.with_attached_images.order(created_at: :asc).reverse_order.limit(10)
    end

    @hot = Post.all.with_attached_images.order(cached_votes_score: :desc).limit(1)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @page_title = @post.title
    @hot = Post.all.with_attached_images.order(cached_votes_score: :desc).limit(1)
  end
  # GET /posts/userindex
  def userindex
    @hot = Post.all.with_attached_images.order(cached_votes_score: :desc).limit(1)
    @posts = Post.all.with_attached_images.order(created_at: :desc)
    @page_title = 'From your stall';
  end
  # GET /posts/new
  def new
    @hot = Post.all.with_attached_images.order(cached_votes_score: :desc).limit(1)
    @post = current_user.posts.build
    @page_title = 'New Dump'
  end

  # GET /posts/1/edit
  def edit
    @page_title = 'Dump Edit'
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post}
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url}
      format.json { head :no_content }
    end
  end

  def like
    @post.liked_by current_user
    respond_to do |format|
      format.html {redirect_back fallback_location: root_path}
      format.json {render layout:false}
    end
  end
  def unlike
    @post.unliked_by current_user
    respond_to do |format|
      format.html {redirect_back fallback_location: root_path}
      format.json {render layout:false}
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, images: [])
    end
end
