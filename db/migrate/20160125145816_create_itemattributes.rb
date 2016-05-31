class CreateItemattributes < ActiveRecord::Migration
  def change
    create_table :itemattributes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
