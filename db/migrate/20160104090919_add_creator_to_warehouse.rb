class AddCreatorToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :creator, :integer
  end
end
