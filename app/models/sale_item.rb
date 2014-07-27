class SaleItem < ActiveRecord::Base
  attr_accessible :batch_id, :item_id, :sale_id,:quantity,:linecost
  def newitem(args)
    #code
    item_name = args[:item_id]
    quantity = (args[:quantity]).blank?? 0 : (args[:quantity])
    
    Rails.logger.debug "#{quantity}"
    #use the item name to get the id of the item from the Items table
    @item = Item.where("item_name like ? ",item_name).first
    if @item
    #calculate the line cost and include the sale constant for an ongoing sale
    linecost = quantity * @item.adjusted_price
    Rails.logger.debug "#{linecost}"
    #assign the variables to the instance
    
    self.item_id = @item.id
    self.sale_id = 9999999999.to_i
    self.quantity = quantity.to_f
    self.linecost = linecost.to_f
  end
  end
  def self.in_progress
    #Obtains all the sale items in progress
    where("sale_id = ?",2147483647)
  end
  
end
