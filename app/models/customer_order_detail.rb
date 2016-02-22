class CustomerOrderDetail < ActiveRecord::Base
    belongs_to :product
    belongs_to :customer_order
    
    before_validation :update_current_price_from_product
  
    def update_current_price_from_product
      if self.price.nil?
          self.price = product.product_price.price
      end    
    end
    
    def total
      price*quantity
    end
end
