class AddCreatorToBackuplog < ActiveRecord::Migration
  def change
    add_column :backuplogs, :creator, :integer
  end
end
