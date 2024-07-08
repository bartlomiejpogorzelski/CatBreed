# frozen_string_literal: true

class Shared::SearchFormComponent < ViewComponent::Base
  attr_reader :f

  def initialize(f:)
    @f = f
  end

  private

  def neutered_checked
    params[:q].present? && ActiveRecord::Type::Boolean.new.cast(params[:q][:neutered_eq])
  end
end
