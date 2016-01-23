class CustomerOrder < ActiveRecord::Base
  has_many :customer_order_details, dependent: :destroy
  accepts_nested_attributes_for :customer_order_details, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
  
  def save_from_cart(cart)
    cart.line_items.each do |item|
      self.customer_order_details.create(product_id: item.product_id, quantity: item.quantity)
    end
  end
end
