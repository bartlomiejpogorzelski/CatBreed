require 'rails_helper'

RSpec.describe 'Ecommerce checkout', type: :feature, js: true do
  let!(:product) { create(:product, price: 1000) } # cena w groszach: 10 PLN

  it 'creates a checkout session and redirects to Stripe' do

    product = Product.create!(name: 'Test Product', price: 100, stock: 10)

    visit ecommerce_product_path(product)
    click_button 'Add to Cart/Do koszyka'

    click_button 'Do kasy'

    expect(page.current_url).to include('https://checkout.stripe.com')
  end
end
