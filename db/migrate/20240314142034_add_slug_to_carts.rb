class AddSlugToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :slug, :string
    add_index :carts, :slug, unique: true
  end
end
