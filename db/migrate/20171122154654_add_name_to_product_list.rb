class AddNameToProductList < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :product_name, :string
  end
end
