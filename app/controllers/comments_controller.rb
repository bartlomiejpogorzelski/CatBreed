class CommentsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_post

  def create
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      # flash[:alert] = 'Comments has not been created'
      render component:  Posts::CommentFormComponent.new(post: @post, comment: @comment)
      # redirect_to post_path(@post)
    end
  end

  def destroy
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
