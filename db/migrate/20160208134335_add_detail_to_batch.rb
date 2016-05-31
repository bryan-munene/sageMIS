class AddDetailToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :expiry_date, :datetime
    add_column :batches, :batch_no, :string
    add_column :batches, :item_id, :integer
  end
end
