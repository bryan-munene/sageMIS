class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_code
      t.string :item_name
      t.string :item_attribute
      t.string :size
      t.decimal :buying_price
      t.string :source
      t.integer :tax_class
      t.integer :warehouse
      t.decimal :markup
      t.decimal :calculated_selling
      t.decimal :adjusted_price
      t.string :custom_size
      t.string :custom_attribute

      t.timestamps
    end
  end
end
