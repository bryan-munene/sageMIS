class AddCreatorToItemAttribute < ActiveRecord::Migration
  def change
    add_column :itemattributes, :creator, :integer
  end
end
