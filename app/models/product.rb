class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :photos, dependent: :destroy

  validates :name, :price, :stock, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true

  scope :active, -> { where(active: true) }
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? && attributes['id'].blank? }
end
