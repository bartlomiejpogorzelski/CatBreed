require "rails_helper"

RSpec.describe Cats::ReservationsController, type: :controller do
  let(:cat) { create(:cat) } 
  let(:valid_attributes) { attributes_for(:reservation, cat_id: cat.id, start_date: "2023-11-23T12:12") }
  let(:invalid_attributes) { attributes_for(:reservation, cat_id: cat.id, start_date: nil) }
  let(:reservation) { create(:reservation, cat_id: cat.id, start_date: "2023-11-23T12:12")  }

  describe "POST #create" do
    context "with valid params" do
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

    context "with invalid params" do
      it 'does not create a new reservation' do
        expect do
          post :create, params: { reservation: invalid_attributes }
        end.to change(Reservation, :count).by(0)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params to accept reservation" do
      it 'updates the reservation to deposit_paid: true' do
        patch :update, params: { id: reservation.id, deposit_paid: true }, format: :turbo_stream
        reservation.reload
        expect(reservation.deposit_paid).to eq(true)
      end

      it 'updates the cat status to reserved' do
        patch :update, params: { id: reservation.id, deposit_paid: true }, format: :turbo_stream
        reservation.cat.reload
        expect(reservation.cat.status).to eq('reserved')
      end

      it 'renders the turbo_stream template' do
        patch :update, params: { id: reservation.id, deposit_paid: true }, format: :turbo_stream
        expect(response.media_type).to eq Mime[:turbo_stream].to_s
      end
    end

    context "with valid params to cancel reservation" do
      it 'updates the reservation to deposit_paid: false' do
        patch :update, params: { id: reservation.id, deposit_paid: false }, format: :turbo_stream
        reservation.reload
        expect(reservation.deposit_paid).to eq(false)
      end

      it 'updates the cat status to available' do
        patch :update, params: { id: reservation.id, deposit_paid: false }, format: :turbo_stream
        reservation.cat.reload
        expect(reservation.cat.status).to eq('available')
      end

      it 'renders the turbo_stream template' do
        patch :update, params: { id: reservation.id, deposit_paid: false }, format: :turbo_stream
        expect(response.media_type).to eq Mime[:turbo_stream].to_s
      end
    end
  end
end
