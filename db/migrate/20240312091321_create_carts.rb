class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.decimal :price

      t.belongs_to :user

      t.timestamps
    end
  end
end
