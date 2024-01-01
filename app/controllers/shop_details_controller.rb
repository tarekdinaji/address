class ShopDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index 
    @result = SearchShop.new(params[:country]).call

    render json: @result
  end 

  def show 
    find_shop_detail

    render json: @shop_detail
  end  

  def create 
    @new_shop = ShopDetail.new(shop_name: params[:shop_name], country: params[:country], address_line_1: params[:address_line_1], address_line_2: params[:address_line_2], zipcode: params[:zipcode], country_code: params[:country_code], google_map_location: params[:google_map_location])

    if @new_shop.save 
      render json: @new_shop
    else 
      render json: @new_shop.errors
    end 
  end  

  def update
    @shop_to_update = ShopDetail.find(params[:id])
    if @shop_to_update.update(shop_name: params[:shop_name], country: params[:country], address_line_1: params[:address_line_1], address_line_2: params[:address_line_2], zipcode: params[:zipcode], country_code: params[:country_code], google_map_location: params[:google_map_location]) 
      render json: @shop_to_update
    else 
      render json: @shop_to_update.errors
    end 
  end  

  private 

   def find_shop_detail
    @shop_detail = ShopDetail.find(params[:id])
   end 
  # Can not use strong params because of API issues
  #  def shop_detail_params
  #   #using strong parameters
  #   params.permit(:shop_name, :country, :address_line_1, :address_line_2, :zipcode, :country_code, :google_map_location, :phone_number)
  #  end

end

#{"country":"Albenia","state":"","district":"kasanda","zipcode":"56733"}
