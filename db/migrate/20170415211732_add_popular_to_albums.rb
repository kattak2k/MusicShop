class AddPopularToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :popular, :boolean
    add_index :albums, :popular
  end
end
