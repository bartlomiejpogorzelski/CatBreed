# frozen_string_literal: true

class Admin::Cats::NewCatComponent < ViewComponent::Base

  attr_reader :cat

  def initialize(cat:)
    @cat = cat
  end
  
end
