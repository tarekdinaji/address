class ShopAddressesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index 
    @shop_addresses = ShopAddress.all 

    render json: @shop_addresses
  end 

  def show 
    find_shop_address

    render json: @shop_address
  end 

  def new 
    @shop_address = ShopAddress.new
  end 

  def create 
    shop_address = ShopAddress.new(shop_address_params)

    if shop_address.save 
      render json: shop_address 
    else 
      render json: shop_address.errors
    end 
    
  end  


  private 

   def find_shop_address 
    @shop_address = ShopAddress.find(params[:id])
   end 

   def shop_address_params
    #using strong parameters
    params.require(:shop_address).permit([:country, :state, :district, :zipcode ])
   end

end

#{"country":"Albenia","state":"","district":"kasanda","zipcode":"56733"}
