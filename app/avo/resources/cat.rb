class Avo::Resources::Cat < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
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
    # field :reservation, as: :has_one
    field :reservation, as: :text do |cat|
      if cat&.reservation
        "Rezerwacja nr #{cat.reservation.id}"
      else
        "Brak rezerwacji"
      end
    end    
  end
end
