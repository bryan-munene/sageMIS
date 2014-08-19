class Batch < ActiveRecord::Base
  belongs_to :item
  attr_accessible :date, :description, :name, :no_of_items,:expiry_date,:batch_no,:creator,:remaining_items
  before_create :set_remaining_items
  def set_remaining_items
    self.remaining_items = self.no_of_items
  end
  def self.currently_selling_batch(item_id)
      #returns the batch will have items deducted from it in the next sale
    find(:first, :conditions => [ "item_id = :itm AND remaining_items > 0", {:itm =>item_id}],:order => "expiry_date DESC")  
  end
  def self.sellable_batches(item_id)
    find(:all, :conditions => [ "item_id = :itm AND remaining_items > 0", {:itm =>item_id}],:order => "expiry_date DESC")  
  end
  def self.last_cleared_batch(item_id)
    find(:first, :conditions => [ "item_id = :itm AND remaining_items = 0", {:itm =>item_id}],:order => "expiry_date DESC")  
  end
end
