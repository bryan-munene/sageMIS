class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :value
      t.string :float
      t.integer :number_of_items
      t.integer :user
      t.integer :mode_of_payment
      t.integer :till_no

      t.timestamps
    end
  end
end
