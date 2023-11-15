class AddCatToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :cat, foreign_key: true
  end
end
