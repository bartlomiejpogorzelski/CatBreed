class Cat < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_one :reservation, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? && attributes['id'].blank? }

  BREEDS = %w[
    abyssinian
    bengal
    birman
    british_shorthair
    sphynx
    maine_coon
    russian_blue
    scottish_fold
    siamese
    persian
  ].freeze

  validates :name, presence: true
  validates :breed, inclusion: { in: BREEDS }  

  enum status: {
    available: "Available", #For translate
    reservation_reported: "Reservation reported",
    reserved: "Reserved",
    sold: "Sold"
  }

  scope :not_parent, -> { where(is_parent: false) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "status", "updated_at", "neutered", "name"]
  end

  def self.breed_options
    BREEDS.map { |breed| [I18n.t("cats.breeds.#{breed}"), breed] }
  end

end

