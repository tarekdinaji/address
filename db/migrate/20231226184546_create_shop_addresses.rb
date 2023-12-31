class CreateShopAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_addresses do |t|
      t.string :country, name: "index_shop_addresses_on_country", unique: true 
      t.string :state
      t.string :district
      t.string :zipcode

      t.timestamps
    end
  end
end
