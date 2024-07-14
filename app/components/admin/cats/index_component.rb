# frozen_string_literal: true

class Admin::Cats::IndexComponent < ViewComponent::Base
  include Turbo::StreamsHelper

  attr_reader :cats

  def initialize(cats:)
    @cats = cats
  end

  private

end
