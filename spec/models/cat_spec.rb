require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'has a valid factory' do
    expect(build(:cat)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:cat, name: nil)).not_to be_valid
  end

  it 'is invalid without a breed' do
    expect(build(:cat, breed: nil)).not_to be_valid
  end

  it 'has one reservation' do
    association = described_class.reflect_on_association(:reservation)
    expect(association.macro).to eq :has_one
  end
end
