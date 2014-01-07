class AddDetailsToItem < ActiveRecord::Migration
  def change
    add_column :items, :item_description, :string
    add_column :items, :original_price, :string
    add_column :items, :dosage, :string
    add_column :items, :manufacturer, :string
  end
end
