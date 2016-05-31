class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.integer :no_of_items

      t.timestamps
    end
  end
end
