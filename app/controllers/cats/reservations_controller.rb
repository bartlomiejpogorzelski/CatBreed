class Cats::ReservationsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @reservation = Reservation.new
    render Kittens::Reservations::ReservationComponent.new(cat: @cat, reservation: @reservation)
  end

  def create
    @cat = Cat.find(params[:reservation][:cat_id])
    @reservation = @cat.build_reservation(reservation_params)

    if @reservation.save
      @cat.update(status: :reservation_reported)
      render HomeComponent.new #TO change
    else
      render Kittens::Reservations::ReservationComponent.new(cat: @cat, reservation: @reservation)
    end
  end

  def update
    @reservation = Reservation.find(params[:id])   
   
    if (@reservation.update(deposit_paid: params[:deposit_paid]) && @reservation.cat.update(status: determine_status))
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "cat_#{@reservation.cat.id}",
            Admin::Cats::CatRowComponent.new(cat: @reservation.cat)
          )
        end
      end
    end
   end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :deposit_paid, :cat_id)
  end

  def determine_status
    @reservation.deposit_paid? ? :reserved : :available
  end

end
