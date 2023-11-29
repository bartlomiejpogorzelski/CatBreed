# frozen_string_literal: true

class Shared::SearchFormComponent < ViewComponent::Base

  attr_reader :f

  def initialize(f:)
    @f = f
  end

end
