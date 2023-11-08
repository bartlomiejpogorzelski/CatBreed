# frozen_string_literal: true

class Cats::ParentDetailsComponent < ViewComponent::Base

  attr_reader :cat

  def initialize(cat:)
    @cat = cat
  end

end
