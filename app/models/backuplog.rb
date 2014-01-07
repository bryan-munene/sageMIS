class Backuplog < ActiveRecord::Base
  attr_accessible :backup_log_date, :days_pending, :start_date, :status, :user_id
end
