class AddDetailToUser < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
    add_column :users, :is_first_time, :integer
    add_column :users, :failed_attempts, :integer
  end
end
