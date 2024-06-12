class Post < ApplicationRecord
  belongs_to :user
  has_one :photo
  has_many :comments, dependent: :destroy
end
