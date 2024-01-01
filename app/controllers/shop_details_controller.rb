class ShopDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index 
    @result = SearchShop.new(params[:country_code]).call

    render json: @result
  end 

  def show 
    find_shop_detail

    render json: @shop_detail
  end 

  def new 
    @shop_detail = ShopDetail.new
  end 

  def create 
    shop_detail = ShopDetail.new(shop_detail_params)

    if shop_detail.save 
      render json: shop_detail
    else 
      render json: shop_detail.errors
    end 
    
  end  


  private 

   def find_shop_detail
    @shop_detail = ShopDetail.find(params[:id])
   end 

   def shop_detail_params
    #using strong parameters
    params.require(:shop_detail).permit([:shop_name, :country, :address_line_1, :address_line_2, :zipcode, :country_code, :google_map_location, :phone_number ])
   end

end

#{"country":"Albenia","state":"","district":"kasanda","zipcode":"56733"}
