class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :first_name, as: :text
    field :last_name, as: :text
    field :phone_number, as: :text
    field :email, as: :text
    field :role, as: :select, enum: ::User.roles
    field :provider, as: :text
    field :uid, as: :text
    field :posts, as: :has_many
    field :comments, as: :has_many
  end
end
