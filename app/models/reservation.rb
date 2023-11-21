class Reservation < ApplicationRecord
  belongs_to :cat
  validates :start_date, presence: true
end
