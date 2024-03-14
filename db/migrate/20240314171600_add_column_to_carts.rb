class AddColumnToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :title, :string
  end
end
