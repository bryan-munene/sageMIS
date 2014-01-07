class AddDetailToItems < ActiveRecord::Migration
  def change
    add_column :items, :cvs_import, :boolean
  end
end
