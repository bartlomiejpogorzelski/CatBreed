# frozen_string_literal: true

class Kittens::KittensComponent < ViewComponent::Base

  attr_reader :cats

  def initialize(cats:)
    @cats = cats
  end  

end
