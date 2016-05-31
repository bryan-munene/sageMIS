class AddDetailToSaleItem < ActiveRecord::Migration
  def change
    add_column :sale_items, :quantity, :float
    add_column :sale_items, :linecost, :float
  end
end
