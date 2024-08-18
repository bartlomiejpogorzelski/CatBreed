# spec/features/user_login_spec.rb

require 'rails_helper'

RSpec.describe 'User Login', type: :feature, js: true do
  let!(:user) { create(:user, email: 'john.doe@example.com', password: 'password123') }

  it 'allows a user to log in' do
    # Page for login user
    visit new_user_session_path

    # Fill form for log in
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password123'

    click_button 'Log in'

    # Check that user was signed
    expect(page).to have_current_path(root_path, ignore_query: true) # ignore_query that is ignore request in path
    # expect(page).to have_content('Signed in successfully')  
  end
end
