module Codegen
  def generate_item_code(warehouse_number,item_number,item_name)
    item_num_size = item_number.to_s.length
    expected_code_length = 5

    #start with the warehouse number
    full_code = warehouse_number

    loaded_size =  prepend_zeros(item_number.to_s,(expected_code_length-item_num_size))
    Rails.logger.debug(loaded_size)
    full_code.concat("-").concat(loaded_size)
  end
  def generate_warehouse_code(warehouse_number,warehouse_name)
    expected_code_length = 3
    add_value = expected_code_length - warehouse_number.to_s.length
    loaded = prepend_zeros(warehouse_number.to_s,add_value)
    #prepend the first letter of the warehouse
    #Rails.logger.debug(warehouse_number)
    warehouse_name[0,1].concat("-").concat(loaded)
  end
  def prepend_zeros(string_supplied,additional_zeros)
      expected_string = ""
      start = 0
      #while start <= additional_zeros
            #keep adding zeros till the number is equalized
       #     expected_string.concat("0")
       #     start=start+1
      #end
      expected_string = "0"*additional_zeros
        expected_string.concat(string_supplied)
    #Rails.logger.debug(string_supplied)
  end
  def update_log_trail

  end
  def update_errors

  end
end