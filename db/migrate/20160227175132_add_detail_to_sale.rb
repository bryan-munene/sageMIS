class AddDetailToSale < ActiveRecord::Migration
  def change
    add_column :sales, :valueofsale, :float
    add_column :sales, :discountamount, :float
  end
end
