require "rails_helper"

RSpec.describe Ecommerce::StripeController, type: :controller do
  describe "POST #webhook" do
    let(:user) { create(:user) }
    let(:product) { create(:product, stock: 5, price: 100) }

    let(:cart_metadata) do
      [
        { "product_id" => product.id, "quantity" => 2 }
      ].to_json
    end

    let(:stripe_event) do
      Stripe::Event.construct_from(
        id: "evt_test",
        type: "checkout.session.completed",
        data: {
          object: {
            id: "cs_test",
            metadata: {
              user_id: user.id,
              cart: cart_metadata
            }
          }
        }
      )
    end

    before do
      allow(Stripe::Webhook).to receive(:construct_event).and_return(stripe_event)
    end

    it "creates an order with order_items and reduces stock" do
      expect {
        post :webhook
      }.to change(Order, :count).by(1)
        .and change(OrderItem, :count).by(1)

      order = Order.last
      order_item = order.order_items.first

      expect(order.user).to eq(user)
      expect(order.status).to eq("paid")
      expect(order_item.product).to eq(product)
      expect(order_item.quantity).to eq(2)
      expect(product.reload.stock).to eq(3) # 5 - 2 = 3
    end
  end
end
