class ChangeColumnitemDrugNametoItems < ActiveRecord::Migration
  def up
	change_column :items, :item_drug_name, :string, after: :item_name
  end

  def down
  end
end
