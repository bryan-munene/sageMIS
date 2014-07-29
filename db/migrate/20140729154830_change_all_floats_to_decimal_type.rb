class ChangeAllFloatsToDecimalType < ActiveRecord::Migration
  def up
    change_column :sale_items, :linecost, :decimal,:precision=>15,:scale=>2
    change_column :sale_items, :quantity, :decimal,:precision=>15,:scale=>2
    change_column :sales, :valueofsale, :decimal,:precision=>15,:scale=>2
    change_column :sales, :discountamount, :decimal,:precision=>15,:scale=>2
  end

  def down
  end
end
