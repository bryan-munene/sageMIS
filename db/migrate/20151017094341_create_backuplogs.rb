class CreateBackuplogs < ActiveRecord::Migration
  def change
    create_table :backuplogs do |t|
      t.datetime :backup_log_date
      t.datetime :start_date
      t.string :status
      t.integer :days_pending
      t.integer :user_id

      t.timestamps
    end
  end
end
