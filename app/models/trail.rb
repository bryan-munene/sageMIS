class Trail < ActiveRecord::Base
  attr_accessible :additionalinfo, :currentvalue, :description, :model, :prevvalue, :status, :user
end
