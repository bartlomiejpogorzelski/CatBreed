class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :platform
      t.string :name
      t.string :token
      t.string :shop_domain

      t.timestamps
    end
  end
end
