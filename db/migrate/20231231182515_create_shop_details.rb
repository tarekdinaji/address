class CreateShopDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_details do |t|
      t.string :shop_name
      t.string :country 
      t.string :address_line_1
      t.string :address_line_2
      t.string :zipcode
      t.string :country_code
      t.string :google_map_location
      t.string :phone_number
      t.timestamps
    end
  end
end
