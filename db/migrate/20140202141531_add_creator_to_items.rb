class AddCreatorToItems < ActiveRecord::Migration
  def change
    add_column :items, :creator, :integer
  end
end
