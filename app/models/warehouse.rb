class Warehouse < ActiveRecord::Base
  include Codegen
  attr_accessible :address, :location, :name ,:whcode,:creator
  before_save :capitalize_item_name
  after_save :generate_code
  def capitalize_item_name
    self.name.upcase!
  end
  def generate_code
    wh_code = generate_warehouse_code(self.id,self.name)
    if self.whcode.to_s.length < 1
      self.update_attributes(
        :whcode => wh_code
      )
    #  Rails.logger.debug("Updating the code")
    #self.item_code = item_code
    #self.send(:update_without_callbacks)
    end
  end

end
