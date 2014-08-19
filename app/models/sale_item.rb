  class SaleItem < ActiveRecord::Base
    include ApplicationHelper
    attr_accessible :batch_id, :item_id, :sale_id,:quantity,:linecost
    validate :remaining_items_threshold
    def newitem(args)
      #code
      item_name = args[:item_id]
      quantity = normalize_quantity(args[:quantity])
      if item_name.to_s.length > 0 && quantity > 0
        #Rails.logger.debug "#{quantity}"
        #use the item name to get the id of the item from the Items table
        @item = Item.where("item_name like ? ",item_name).first
        if @item
        #calculate the line cost and include the sale constant for an ongoing sale
        linecostm = quantity.to_f * @item.adjusted_price.to_f
        
        #Rails.logger.debug "#{linecost}"
        #assign the variables to the instance
        
        self.item_id = @item.id
        self.sale_id = 9999999999.to_i
        self.quantity = quantity.to_f.round(2)
        self.linecost = linecostm.round(2)
      else
        #there was no item by that name
        errors.add("item_id","No item found by that name")
      end
    else
      errors.add("item_id","Item and quantity cannot be empty")
    end
    end
    def normalize_quantity(valuegiven)
     
      if valuegiven.to_s.blank? or valuegiven.to_s.nil?
        return 0
      end
      if valuegiven.to_s.include?'/' 
        #normalize the value to a decimal
        top = valuegiven.split("/").first
        bottom = valuegiven.split("/").last
        if top.to_f>0 and bottom.to_f>0
          #code
          return top.to_f/bottom.to_f
        else
          errors.add("quantity","Invalid fraction values")
        end
        
      else
        return valuegiven.to_f
      end
      
    end
    def remaining_items_threshold
      #get the quantity remaining from all batches
      if self.item_id
      stock_level_detail = stock_display(self.item_id)
      stck = current_sale_stock_display(9999999999,self.item_id)
      remainder = stock_level_detail[:total_remaining] - stck
      #check the total remaining items in the batches are greater than quantity
      #Rails.logger.debug "#{remainder}"
      if self.quantity.nil?
        errors.add("quantity","This item does not have any batches in stock")
      else
      if self.quantity > remainder
        #code
        errors.add("quantity","The quantity #{self.quantity} is greater than the remaining number #{remainder}")
      end
    end
    else
      errors.add("item_id","Item cannot be empty")
    end

    end
    def current_sale_stock_display(sale_id,item_id)
      total_cumulated = 0.0
      @saleitems = SaleItem.where("item_id = #{item_id} AND sale_id = #{sale_id}")
        
      total_cumulated = 0.0 
      if @saleitems && @saleitems.size > 0
         @saleitems.each do |saleitem| 
          total_cumulated = total_cumulated + saleitem.quantity
        end 
      end
      return total_cumulated
    end
    def self.in_progress
      #Obtains all the sale items in progress
      #where("sale_id = ?",2147483647)
      where("sale_id = ?",9999999999)
    end
    
  end
