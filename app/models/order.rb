class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_one :shipment, dependent: :destroy

  enum status: { pending: 0, paid: 1, shipped: 2, cancelled: 3 }
  validates :status, presence: true

  before_save :update_total

  def calculate_total
    order_items.sum("quantity * unit_price")
  end

  private

  def update_total
    self.total = calculate_total
  end
end