class Item < ActiveRecord::Base
  attr_accessible :adjusted_price, :buying_price, :calculated_selling, :custom_attribute, :custom_size, :item_attribute, :item_code, :item_name, :markup, :size, :source, :tax_class, :warehouse,:item_description,:dosage,:manufacturer,:original_price,:cvs_import,:old_item_number
end
