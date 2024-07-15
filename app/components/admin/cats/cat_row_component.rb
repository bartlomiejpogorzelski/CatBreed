# frozen_string_literal: true

class Admin::Cats::CatRowComponent < ViewComponent::Base
  include Turbo::StreamsHelper

  attr_reader :cat

  def initialize(cat:)
    @cat = cat
  end

  private

  def reservation_action(cat:, deposit_paid:)
    reservation_path(id: cat&.reservation&.id, deposit_paid: deposit_paid)
  end

  def sold_action(cat:)
    admin_cat_path(id: cat&.id, status: :sold)
  end
end
