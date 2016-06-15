class Sale < ActiveRecord::Base
  attr_accessible  :mode_of_payment, :number_of_items, :till_no, :user, :value,:valueofsale,:discountamount
  validate :discount_is_proper
  after_destroy :revert_items_to_stock
  def discount_is_proper
    if self.discountamount.to_f < 0
      #code
      errors.add("discount","Discount cannot be negative")
    end
    if self.discountamount.to_f > self.valueofsale
      #code
      errors.add("discount","Discount cannot be greater than value of sale")
    end
    
  end
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
		totaldiscount = discountamount.to_f
        totalitems = totalitems + sale.quantity.to_f  
	  end
    end
    #create the sale and update the existing sales items
    self.number_of_items = totalitems
    self.till_no =0
    self.user =0
    self.mode_of_payment = 1
    self.discountamount
    self.valueofsale =totalcost - discountamount
    #self.discountamount = 0.0
    
    #call the update method
    #Rails.logger.debug"#{self.id}"
  end
  def update_tempsale(sale_id)
    
    SaleItem.update_all( "sale_id = #{sale_id}", "sale_id = '9999999999'" )
    #Log the batch size
    #Rails.logger.debug "#{@items_to_update.inspect}"
    for sale in @items_to_update
        deduct_from_inventory(sale.item_id,sale.quantity)  
    end
  end
  def deduct_from_inventory(itemid,quantity)
    #deducts a given amount from the inventory upon update of a sale
    #@batches = Batch.find_by_item_id.order("expiry_date",'ASC')
     #@batches = Batch.find(:all, :conditions => [ "item_id = ?", itemid],:order => "expiry_date DESC")
    @batches = Batch.sellable_batches(itemid)
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
  def self.sale_per_range(date_from,date_to = nil)
    #Returns the sales of the date range supplied
    
    #@selected_date.beginning_of_day..@selected_date.end_of_day
    if date_from.nil?
      date_fr = Date.today
    else
    date_fr = date_from.map{|k,v| v}.join("-").to_date
    end
    if date_to.nil?
      where(created_at: date_fr.to_date.beginning_of_day..date_fr.to_date.end_of_day)
    else
      #code
      date_t = date_to.map{|k,v| v}.join("-").to_date
      where(created_at: date_fr.beginning_of_day..date_t.end_of_day)
    end
  end
  def revert_items_to_stock(sale_id = nil)
    #reverts items to the stock on delete
    if sale_id.nil?
      #code
      sale = self.id
    else
      sale = sale_id
    end
    #find all items relating to this sale
    @items = SaleItem.find(:all, :conditions => [ "sale_id = ?", sale])
    
    @items.each do|item |
      #update the number of items to the current batch
      batch_of_interest = Batch.currently_selling_batch(item.item_id)
      if batch_of_interest.nil?
        #Get the last emptied batch
        batch_of_interest = Batch.last_cleared_batch(item.item_id)
      end
      if batch_of_interest.nil?
        #Do nothing as this is an item without stock
        Rails.logger.error "No batch for #{item.item_id} must be an unusual sale"
      else
        
      amount_update = batch_of_interest.remaining_items.to_f+item.quantity.to_f
      Batch.update_all("remaining_items = #{amount_update}","id = #{batch_of_interest.id}")
      end
    end
  end
  
end
