# frozen_string_literal: true

class Kittens::Reservations::ReservationComponent < ViewComponent::Base

  attr_reader :cat, :reservation

  def initialize(cat:, reservation:)
    @cat = cat
    @reservation = reservation
  end

end
