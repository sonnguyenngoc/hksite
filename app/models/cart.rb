class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
        current_item.quantity += 1
    else
        current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
  
  def remove_item(line_item_id)
    self.line_items.where(id: line_item_id).destroy_all
  end
  
  def total_order
    amount = 0.0
    self.line_items.each do |od|
      amount += od.total_item
    end
    return amount
  end
end
