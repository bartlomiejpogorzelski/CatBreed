# frozen_string_literal: true

class Posts::CommentFormComponent < ViewComponent::Base
  include ActionView::Helpers::FormHelper
  include ActionText::Engine.helpers
  include Rails.application.routes.url_helpers

  attr_reader :post, :comment

  def initialize(post:, comment:)
    @post = post
    @comment = comment
  end

  def main_app
    Rails.application.routes.url_helpers
  end
end
