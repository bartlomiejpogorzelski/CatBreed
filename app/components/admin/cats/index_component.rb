# frozen_string_literal: true

class Admin::Cats::IndexComponent < ViewComponent::Base

  attr_reader :cats

  def initialize(cats:)
    @cats = cats
  end

  private

  def accept_reservation(cat:)
    reservation_path(reservation_id: cat&.reservation&.id, deposit_paid: :true)
  end  
end
