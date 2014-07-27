class Batch < ActiveRecord::Base
  belongs_to :item
  attr_accessible :date, :description, :name, :no_of_items,:expiry_date,:batch_no,:creator
end
