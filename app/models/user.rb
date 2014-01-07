class User < ActiveRecord::Base
  attr_accessible :archived, :email, :first_name, :is_locked, :last_name, :password, :salt, :user_name
end
