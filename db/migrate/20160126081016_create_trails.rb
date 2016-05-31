class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :model
      t.string :prevvalue
      t.string :currentvalue
      t.integer :user
      t.string :description
      t.string :status
      t.string :additionalinfo

      t.timestamps
    end
  end
end
