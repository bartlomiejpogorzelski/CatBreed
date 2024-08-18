require 'rails_helper'

RSpec.describe 'Contact form submission', type: :feature, js: true do
  it 'submits the contact form successfully' do
    # Go to page adress
    visit '/contact_form/new'

    # Fill form
    fill_in 'contact_form[name]', with: 'John Doe'
    fill_in 'contact_form[subject]', with: 'Test Subject'
    fill_in 'contact_form[email]', with: 'john.doe@example.com'
    fill_in 'contact_form[message]', with: 'This is a test message.'

    # Send form
    click_button 'Submit'

    # Check form is send correctly, redirect to main page
    expect(current_path).to eq(root_path)
  end
end
