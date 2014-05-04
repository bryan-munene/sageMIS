class AddCreatorToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :creator, :integer
  end
end
