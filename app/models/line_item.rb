class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def total_item
    if product.price != ""
        product.price*quantity
    end
  end
end
