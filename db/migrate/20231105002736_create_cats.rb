class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :breed
      t.string :color
      t.date :date_of_birth
      t.string :gender
      t.text :description
      t.string :images
      t.string :pedigree_information
      t.decimal :price
      t.string :status
      t.string :vaccination_information
      t.string :health_status
      t.string :owner_information
      t.string :location
      t.boolean :neutered
      t.text :notes
      t.string :videos
      t.boolean :is_parent

      t.timestamps
    end
  end
end
