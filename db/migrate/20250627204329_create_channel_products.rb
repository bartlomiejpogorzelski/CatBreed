class CreateChannelProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_products do |t|
      t.references :channel, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :external_id

      t.timestamps
    end
  end
end
