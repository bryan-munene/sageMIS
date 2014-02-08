class Session < ActiveRecord::Base
  attr_accessible :login_ip, :login_status, :timeout, :user_id
end
