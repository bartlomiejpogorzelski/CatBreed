# frozen_string_literal: true

class Posts::CommentComponent < ViewComponent::Base
  attr_reader :comment, :post, :current_user

  def initialize(comment:, post:, current_user:)
    @comment = comment
    @post = post
    @current_user = current_user
  end
end