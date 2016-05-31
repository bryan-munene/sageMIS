class AddCreatorToTaxcode < ActiveRecord::Migration
  def change
    add_column :taxcodes, :creator, :integer
  end
end
