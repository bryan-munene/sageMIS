class ItemAttributeDetail < ActiveRecord::Base
  attr_accessible :attribute_id, :item_id, :value
end
