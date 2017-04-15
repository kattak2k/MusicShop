class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true
      t.integer :quantity, default: 1 
   
      t.timestamps

      # adding userid and albumid to guarantee uniqueness
      #add_index :cart_items, [:user_id,:album_id] , unique: true
    end
  end
end
