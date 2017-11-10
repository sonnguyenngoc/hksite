class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def total_item
      product.display_price*quantity
  end
  
  def get_product_image
    self.product.product_image.image
  end
  
  def get_product_name
    self.product.display_name
  end
  
  def get_product_price
    self.product.display_price
  end
  
end
