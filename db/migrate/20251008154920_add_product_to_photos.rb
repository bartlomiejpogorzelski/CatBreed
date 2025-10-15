class AddProductToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :product, null: true, foreign_key: true
  end
end
