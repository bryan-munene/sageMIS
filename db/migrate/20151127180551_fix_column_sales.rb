class FixColumnSales < ActiveRecord::Migration
  def up
    rename_column :sales, :float, :floatvalue
  end

  def down
  end
end
