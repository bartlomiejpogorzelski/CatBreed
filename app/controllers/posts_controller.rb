class PostsController < ApplicationController
  load_and_authorize_resource except: [:index, :show]

  def index
    @posts = Post.all
    render Posts::BlogPostComponent.new(posts: @posts)
  end

  def show
    @comments = post.comments
    render Posts::BlogPostDetailsComponent.new(post: post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def post
    @post ||= Post.find(params[:id])
   end
end
