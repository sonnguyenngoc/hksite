class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def total_item
      product.display_price*quantity
  end
end
