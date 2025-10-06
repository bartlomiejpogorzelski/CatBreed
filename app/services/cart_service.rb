class CartService
  attr_reader :session

  def initialize(session)
    @session = session
    @session[:cart] ||= {}
  end

  def add_product(product_id, quantity = 1)
    product_id = product_id.to_s
    @session[:cart][product_id] ||= 0
    @session[:cart][product_id] += quantity
  end

  # Removes a  product from the cart
  def remove_product(product_id)
    @session[:cart].delete(product_id.to_s)
  end

  # Returns a list of items in the cart (product + quantity)
  def items
    Product.where(id: @session[:cart].keys).map do |product|
      quantity = @session[:cart][product.id.to_s]
      OpenStruct.new(product: product, quantity: quantity)
    end
  end

  # Returns the total price of the cart
  def total_price
    items.sum { |item| item.product.price * item.quantity }
  end

  def empty?
    @session[:cart].empty?
  end

  # Does the cart contain the given product?
  def contains?(product_id)
    @session[:cart].key?(product_id.to_s)
  end

  def clear
    @session[:cart] = {}
  end
end
