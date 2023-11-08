# frozen_string_literal: true

class Cats::ParentsComponent < ViewComponent::Base

  attr_reader :cats

  def initialize(cats:)
    @cats = cats
  end

end
