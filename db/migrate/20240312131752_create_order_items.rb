class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
