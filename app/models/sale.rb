class Sale < ActiveRecord::Base
  attr_accessible :float, :mode_of_payment, :number_of_items, :till_no, :user, :value
end
