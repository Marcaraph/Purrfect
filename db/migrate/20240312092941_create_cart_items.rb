class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.integer :price
      t.belongs_to :cart
      t.belongs_to :item
      t.timestamps
    end
  end
end
