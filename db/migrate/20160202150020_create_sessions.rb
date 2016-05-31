class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :timeout
      t.string :login_ip
      t.string :login_status

      t.timestamps
    end
  end
end
