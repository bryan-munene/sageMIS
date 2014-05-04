class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :item_id
      t.integer :sale_id
      t.integer :batch_id

      t.timestamps
    end
  end
end
