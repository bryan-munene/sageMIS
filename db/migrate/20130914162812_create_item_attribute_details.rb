class CreateItemAttributeDetails < ActiveRecord::Migration
  def change
    create_table :item_attribute_details do |t|
      t.string :item_id
      t.string :attribute_id
      t.string :value

      t.timestamps
    end
  end
end
