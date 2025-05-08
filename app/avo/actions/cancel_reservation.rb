class Avo::Actions::CancelReservation < Avo::BaseAction
  self.name = "Anuluj rezerwację"
  self.visible = -> { 
    view.show? && resource.record.reservation_reported? 
  }

  def handle(**args)
    query.each do |cat|
      @reservation = Reservation.find(cat&.reservation&.id)   
   
      if ((@reservation.destroy) && @reservation.cat.update(status: :avaiable))
        succeed "Rezerwacja anulowana dla kota #{cat.name}."
      else
        fail "Kot #{cat.name} nie ma rezerwacji."
      end
    end
  end
end
