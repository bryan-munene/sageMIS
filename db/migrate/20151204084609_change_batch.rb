class ChangeBatch < ActiveRecord::Migration
  def up
     change_table :batches do |t|
      t.change :no_of_items, :float
    end
  end

  def down
     change_table :batches do |t|
      t.change :no_of_items, :integer
    end
  end
end
