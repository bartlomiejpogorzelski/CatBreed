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
        redirect_to root_path 
    else
      render Kittens::Reservations::ReservationComponent.new(cat: @cat, reservation: @reservation)
    end
  end

  def update
    @reservation = Reservation.find(params[:id])   
    @reservation.update(deposit_paid: params[:deposit_paid] )
    @reservation.cat.update(status: determine_status )

    render HomeComponent.new
   end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :deposit_paid, :cat_id)
  end

  def determine_status
    @reservation.deposit_paid? ? :reserved : :available
  end

end
