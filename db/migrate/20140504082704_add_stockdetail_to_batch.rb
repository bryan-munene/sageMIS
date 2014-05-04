class AddStockdetailToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :remaining_items, :float
    add_column :batches, :is_active, :integer
    add_column :batches, :ok_limit, :float
    add_column :batches, :mid_limit, :float
    add_column :batches, :below_limit, :float
    add_column :batches, :empty_batch, :integer
    add_column :batches, :user_choice, :integer
    add_column :batches, :auto_shift, :integer
  end
end
