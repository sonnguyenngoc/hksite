class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def total_item
    product.product_price.price*quantity
  end
end
