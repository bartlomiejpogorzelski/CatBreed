# frozen_string_literal: true

class Admin::Cats::CatRowComponent < ViewComponent::Base
  include Turbo::StreamsHelper

  attr_reader :cat

  def initialize(cat:)
    @cat = cat
  end

  private

  def accept_reservation(cat:)
    reservation_path(id: cat&.reservation&.id, deposit_paid: :true)
  end  
end
