class Batch < ActiveRecord::Base
  belongs_to :item
  attr_accessible :date, :description, :name, :no_of_items,:expiry_date,:batch_no,:creator,:remaining_items
  before_create :set_remaining_items
  def set_remaining_items
    self.remaining_items = self.no_of_items
  end
end
