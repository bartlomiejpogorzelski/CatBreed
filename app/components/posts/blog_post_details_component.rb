# frozen_string_literal: true

class Posts::BlogPostDetailsComponent < ViewComponent::Base
  include Turbo::StreamsHelper

  attr_reader :post

  def initialize(post:)
    @post = post
  end  
end
