require "rails_helper"

RSpec.describe Cats::ReservationsController, type: :controller do
  let(:cat) { create(:cat) } 
  let(:valid_attributes) { attributes_for(:reservation, cat_id: cat.id, start_date: "2023-11-23T12:12") }
  let(:invalid_attributes) { attributes_for(:reservation, cat_id: cat.id, start_date: nil) }
  let(:reservation) { create(:reservation, cat_id: cat.id, start_date: "2023-11-23T12:12")  }

  describe "with valid params" do

    it 'creates a new reservation' do
      expect do
        post :create, params: { reservation: valid_attributes }
      end.to change(Reservation, :count).by(1)
    end

    it 'updates cat status to reservation_reported' do
      post :create, params: { reservation: valid_attributes }
      cat.reload
      expect(cat.status).to eq('reservation_reported')
    end

  end

  describe "with not valid params" do

    it 'creates a new reservation' do
      expect do
        post :create, params: { reservation: invalid_attributes }
      end.to change(Reservation, :count).by(0)
    end
  end


  describe 'PATCH #update' do

    context 'with valid params' do
      it 'updates the reservation' do
        patch :update, params: { id: reservation.id, deposit_paid: true }
        reservation.reload
        expect(reservation.deposit_paid).to eq(true)
      end
  
      it 'updates the cat status' do
        expect do
          patch :update, params: { id: reservation.id, deposit_paid: true }
          reservation.cat.reload
        end.to change(reservation.cat, :status).to('reserved')
      end
    end
  end
end

