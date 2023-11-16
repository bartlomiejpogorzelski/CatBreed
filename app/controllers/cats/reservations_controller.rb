class Cats::ReservationsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @reservation = Reservation.new
    render Kittens::Reservations::ReservationComponent.new(cat: @cat, reservation: @reservation)
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @reservation = @cat.reservations.new(reservation_params)

    if @reservation.save
      redirect_to cats_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
