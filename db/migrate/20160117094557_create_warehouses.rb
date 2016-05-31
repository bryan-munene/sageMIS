class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :location
      t.string :address

      t.timestamps
    end
  end
end
