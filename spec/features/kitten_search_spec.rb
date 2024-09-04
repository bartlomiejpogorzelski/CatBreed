require 'rails_helper'

RSpec.describe 'Kitten Search', type: :feature, js: true do

  let!(:neutered_cat) { create(:cat, name: 'Neutered Cat', status: 'available', neutered: true) }
  let!(:not_neutered_cat) { create(:cat, name: 'Not Neutered Cat', status: 'available', neutered: false) }

  it 'allows the user to search for neutered cats' do         
    visit kittens_path
    
    header = find('h2')
    expect(header[:class]).to include('font-bold')
    expect(header[:class]).to include('text-2xl')
    expect(header[:class]).to include('sm:text-3xl')
    expect(header[:class]).to include('md:text-4xl')
    expect(header[:class]).to include('lg:text-5xl')

    fill_in 'Imie', with: "Neut"
    # select 'Available', from: 'status'
    find(:css, "select[name='q[status_in]']").select('Available')
    find(:css, "input[type='checkbox'][name='q[neutered_eq]']").check
    click_button "submit"

    # expect(page).to have_content('Neutered Cat', wait: 10)
  end


end