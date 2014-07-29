class FixColumninSaleItem < ActiveRecord::Migration
  def up
    change_column :sale_items, :sale_id, :bigint
  end

  def down
    change_column :sale_items, :sale_id, :int
  end
end
