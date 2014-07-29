class Item < ActiveRecord::Base
  include Codegen
  attr_accessible  :buying_price, :calculated_selling,:adjusted_price, :custom_attribute, :custom_size, :item_attribute, :item_code, :item_name, :markup, :size, :source, :tax_class, :warehouse,:item_description,:dosage,:manufacturer,:original_price,:cvs_import,:old_item_number,:creator
  before_validation :capitalize_item_name,:default_space_values,:create_markup,:create_selling_price
  after_save :generate_code,:generate_default_batch
 # validates :item_name,:size,:tax_class,:warehouse,:presence=>true
  validates :adjusted_price ,:presence=>true
  validates_length_of :item_name, :minimum => 3
  validates_numericality_of :adjusted_price,:buying_price,:calculated_selling
  validate :price_is_sensible
  validate :adjusted_price_sensible
  has_many :batches


  def price_is_sensible
    #miscellaneous price checks here
    if self.buying_price.to_f < 0  and self.markup.to_f < 0
      errors.add("Buying Price","cannot be less than zero")
    end

  end
  def mark_up_is_sensible
    if self.markup.to_f < 0
      errors.add("Markup","is less than zero")
    end
  end
  
  def adjusted_price_sensible
    #miscellaneous price checks here
   # Rails.logger.debug "#{self.inspect}"
    if self.adjusted_price.to_i == 0 
      #errors.add("Selling Price","cannot be zero")
      self.adjusted_price = self.calculated_selling.to_f
    end

  end
  def default_space_values
      #set all non created params to zero or nil
    if self.adjusted_price.nil?
      
       self.adjusted_price = 0
    end
    if self.markup.nil?
       self.markup = 0
     end
  end
  def create_selling_price
      #add markup then get the tax amount for the tax class
    #get tax amount
    if (self.tax_class.to_i)==0
      #use the first tax class as the default
         self.tax_class = 1
    end
    #ignore tax things for the moment
    #tax = Taxcode.find(self.tax_class.to_i)
    #percent_amt = tax.percentage_markup.to_f
   price = (self.buying_price.to_f + self.markup.to_f)
    self.calculated_selling = price
  end
  def create_markup
    if self.markup.to_s.include? "%"
      #convert the percentage to a figure using the buying price
      #remove the percentage
      valu = self.markup.to_s.delete "%"
      amt = (valu.to_f *self.buying_price.to_f)*100
      self.markup = amt.to_f
    end
    
  end
  def capitalize_item_name
    self.item_name.upcase!
  end
  def generate_code
    #warehouse_code = "001"
    if self.warehouse.to_i <1
      self.warehouse = 1
    end
    warehousenum = Warehouse.find(self.warehouse.to_i)
    warehouse_code = warehousenum.whcode
    item_code = generate_item_code(warehouse_code,self.id,item_name)
    if self.item_code.to_s.length < 1
      self.update_attributes(
        :item_code => item_code
      )
    #  Rails.logger.debug("Updating the code")
    #self.item_code = item_code
    #self.send(:update_without_callbacks)
    end
  end
  def generate_default_batch
      #creates a default batch with zero items

  end
  def self.search(search)
  if search
    where('item_name LIKE ?', "%#{search}%")
  else
    scoped
  end
  end
  def self.searchb(search_key)
      like= "%".concat(search_key.concat("%"))
      where("item_name LIKE ?", like)
  end
end
