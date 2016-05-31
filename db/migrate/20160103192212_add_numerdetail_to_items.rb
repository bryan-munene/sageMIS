class AddNumerdetailToItems < ActiveRecord::Migration
  def change
    add_column :items, :old_item_number, :string
  end
end
