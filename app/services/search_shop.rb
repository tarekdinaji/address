class SearchShop

  def initialize(search_params)
    @search_params = search_params
  end

  def call
    sanitize_params
    search
  end

  private

  def sanitize_params
    return if @search_params.blank?
    #If in the begining of a method there is a return clause it is called "Guard clause", 
    # you need to add a blank line after the guard clause
    
    @search_params = @search_params.downcase  
  end

  def search
    if @search_params.present?
      result = ShopDetail.where("country_code ILIKE ?", @search_params).or(ShopDetail.where("country ILIKE ?", @search_params))

      raise ActiveRecord::RecordNotFound if result.empty?
      # this basically sends the default error code if it returns empty
      return result
    else
      ShopDetail.all
    end
  end
end
