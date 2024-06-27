class CommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_post

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.turbo_stream do
          turbo_streams = [
            turbo_stream.append("comments", Posts::CommentComponent.new(comment: @comment, post: @post, current_user: current_user)),
            turbo_stream.replace("new_comment_form", Posts::CommentFormComponent.new(post: @post, comment: Comment.new, submit_label: "Reply"))
          ]
          if @post.comments.count == 1
            turbo_streams.prepend(turbo_stream.remove("no_comments_message"))
          end

          render turbo_stream: turbo_streams
        end
      else
        format.html { redirect_to post_path(@post), alert: 'Failed to add comment' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
   
    respond_to do |format|
      if @comment.destroy
        format.turbo_stream do
          turbo_streams = [
            turbo_stream.remove("comment_#{@comment.id}")
          ]

          if @post.comments.empty?
            turbo_streams << turbo_stream.append("comments", "<p id='no_comments_message' class='brak-komentarzy'>No comments yet.</p>".html_safe)
          end

          render turbo_stream: turbo_streams
        end
      else
        format.html { redirect_to post_path(@post), alert: 'Failed to add comment' }
      end
    end

  end

  def update
    @comment = post.comments.find(params[:id])
  
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("comment_#{@comment.id}", Posts::CommentComponent.new(comment: @comment, post: post, current_user: current_user))
        end

        # format.html { redirect_to post_path(@post), notice: 'Comment was successfully updated.' }
      else
        format.html { redirect_to post_path(@post), alert: 'Failed to update comment' }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def post
    post ||= Post.find(params[:post_id])
  end



end
