class AddPostRefToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :post, foreign_key: true
  end
end
