# frozen_string_literal: true

class Posts::BlogPostComponent < ViewComponent::Base

  attr_reader :posts

  def initialize(posts:)
    @posts = posts
  end  
end
