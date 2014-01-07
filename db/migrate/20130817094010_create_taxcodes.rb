class CreateTaxcodes < ActiveRecord::Migration
  def change
    create_table :taxcodes do |t|
      t.string :name
      t.string :description
      t.string :market_name
      t.decimal :percentage_markup
      t.string :other_info

      t.timestamps
    end
  end
end
