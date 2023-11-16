# frozen_string_literal: true

class Posts::BlogPostDetailsComponent < ViewComponent::Base

  attr_reader :post

  def initialize(post:)
    @post = post
  end  
end
