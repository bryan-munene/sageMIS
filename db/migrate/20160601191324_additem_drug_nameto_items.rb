class AdditemDrugNametoItems < ActiveRecord::Migration
	def change
		add_column :items, :item_drug_name, :string
	end
end