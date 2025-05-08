class Avo::Resources::Cat < Avo::BaseResource
  
  def fields
    field :name, as: :text
    field :breed, as: :text
    field :color, as: :text
    field :date_of_birth, as: :date
    field :gender, as: :text
    field :description, as: :textarea
    field :pedigree_information, as: :text
    field :price, as: :number
    field :status, as: :select, enum: ::Cat.statuses
    field :vaccination_information, as: :text
    field :health_status, as: :text
    field :owner_information, as: :text
    field :location, as: :text
    field :neutered, as: :boolean
    field :notes, as: :textarea
    field :videos, as: :text
    field :is_parent, as: :boolean
    field :photos, as: :has_many

    field :reservation, as: :text do |cat|
      if cat&.reservation
        "Rezerwacja nr #{cat.reservation.id}"
      else
        "Brak rezerwacji"
      end
    end
  end

  def actions
    # Rails.logger.info "Ancestors of ApproveReservation: #{Avo::Actions::ApproveReservation.ancestors}"
    action Avo::Actions::ApproveReservation
    action Avo::Actions::AcceptSale
    action Avo::Actions::CancelReservation
  end
end
