class AddDetailToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :whcode, :string
  end
end
