class PostsController < ApplicationController
  # your code goes here
  def index
    @posts = Post.all
  end

  #get /posts/:id
  def show
    @posts = post.find(params[:id]) 
  end

  #get /posts/new
  def new
    @post = Post.new
  end

  #post /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  # get /posts/:id/edit
  def edit 
    @post = Post.find(params[:id])
  end

  # patch /posts/:id
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end