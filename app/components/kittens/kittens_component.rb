# frozen_string_literal: true

class Kittens::KittensComponent < ViewComponent::Base
  include Ransack::Helpers::FormHelper

  attr_reader :cats, :q

  def initialize(cats:, q:)
    @cats = cats
    @q = q
  end

end
