class AddDepositPaidToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :deposit_paid, :boolean, default: false
  end
end
