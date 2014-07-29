class Sale < ActiveRecord::Base
  attr_accessible  :mode_of_payment, :number_of_items, :till_no, :user, :value,:valueofsale,:discountamount
 @items_to_update
  def process_sale(params)
    #Gets the sale items for the current sale and cumulates them before posting them
    @saleitems = SaleItem.in_progress
    @items_to_update = @saleitems
    totalcost = 0.0
    totaldiscount = 0.0
    totalitems = 0.0
    if @saleitems && @saleitems.size>0
      for sale in @saleitems
        totalcost = totalcost + sale.linecost.to_f
        #totaldiscount =
        totalitems = totalitems + sale.quantity.to_f  
      end
    end
    #create the sale and update the existing sales items
    self.number_of_items = totalitems
    self.till_no =0
    self.user =0
    self.mode_of_payment = 1
    self.valueofsale =totalcost
    self.discountamount = 0.0
    
    #call the update method
    Rails.logger.debug"#{self.id}"
  end
  def update_tempsale(sale_id)
    
    SaleItem.update_all( "sale_id = #{sale_id}", "sale_id = '9999999999'" )
    #Log the batch size
    Rails.logger.debug "#{@items_to_update.inspect}"
    for sale in @items_to_update
        deduct_from_inventory(sale.item_id,sale.quantity)  
      end
  end
  def deduct_from_inventory(itemid,quantity)
    #deducts a given amount from the inventory upon update of a sale
    #@batches = Batch.find_by_item_id.order("expiry_date",'ASC')
     @batches = Batch.find(:all, :conditions => [ "item_id = ?", itemid],:order => "expiry_date ASC")
    #compare the contents
    if @batches.first.remaining_items.to_f < quantity.to_f
      #the batch is not complete
      remainingContent = quantity.to_f - @batches.first.remaining_items.to_f
      #set first batch to zero
      Batch.update_all("remaining_items = 0","id = #{@batches.first.id}")
      
      amount_update = @batches.second.remaining_items - remainingContent
      Batch.update_all("remaining_items = #{amount_update}","id = #{@batches.second.id}")
    else
      amount_update = @batches.first.remaining_items - quantity
      Batch.update_all("remaining_items = #{amount_update}","id = #{@batches.first.id}")
    end 
  end
  def self.details(itemid)
    #code
    SaleItem.find(:all, :conditions => [ "sale_id = ?", itemid])
  end
end
