class CountriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index 
    @countries = Country.all 

    render json: @countries, only: [:name, :id]
  end 

  def show 
    find_country   

    render json: @country
  end 

  def new 
    @country = Country.new
  end 

  def create 
    country = Country.new(country_params)

    if country.save 
      render json: country 
    else 
      render json: country.errors
    end 
    
  end  


  private 

   def find_country 
    @country = Country.find(params[:id])
   end 

   def country_params
    #using strong parameters
    params.require(:country).permit([:name])
   end 

end
