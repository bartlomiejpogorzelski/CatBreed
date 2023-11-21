class Cat < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_one :reservation, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? && attributes['id'].blank? }

  enum status: {
    available: "Available", #For translate
    reservation_reported: "Reservation reported",
    reserved: "Reserved",
    sold: "Sold"
  }
end

