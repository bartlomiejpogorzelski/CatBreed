# frozen_string_literal: true

class Posts::CommentFormComponent < ViewComponent::Base
  include ActionView::Helpers::FormHelper
  include ActionText::Engine.helpers
  include Rails.application.routes.url_helpers

  attr_reader :post, :comment, :submit_label

  def initialize(post:, comment:, submit_label:)
    @post = post
    @comment = comment
    @submit_label = submit_label
  end

  def main_app
    Rails.application.routes.url_helpers
  end
end
