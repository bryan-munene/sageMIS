class AddCreatorToRole < ActiveRecord::Migration
  def change
    add_column :roles, :creator, :integer
  end
end
