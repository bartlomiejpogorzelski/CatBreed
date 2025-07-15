class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :carrier
      t.string :tracking_number
      t.string :status
      t.text :label_url

      t.timestamps
    end
  end
end
