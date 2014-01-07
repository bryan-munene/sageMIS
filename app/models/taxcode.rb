class Taxcode < ActiveRecord::Base
  attr_accessible :description, :market_name, :name, :other_info, :percentage_markup
end
