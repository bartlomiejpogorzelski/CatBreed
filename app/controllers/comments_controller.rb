class CommentsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_post

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Comments has not been created'
      # binding.pry
      # render component:  Posts::CommentFormComponent.new(post: @post, comment: @comment)
      # redirect_to post_path(@post)
      return;
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    if @comment.update(comment_params)
      # Redirect or render as needed
    else
      # Handle unsuccessful comment update
    end
  end
  
  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
