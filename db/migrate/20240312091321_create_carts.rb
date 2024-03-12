class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.decimal :price

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
