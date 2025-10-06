class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.decimal :total
      t.string :payment_method
      t.string :external_id
      t.datetime :paid_at

      t.timestamps
    end
  end
end
