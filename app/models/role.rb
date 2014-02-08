class Role < ActiveRecord::Base
  #belongs_to user :through =>role_id
  attr_accessible :description, :name
end
