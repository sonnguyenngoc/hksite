class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :manufacturer
  has_one :product_info, dependent: :destroy
  has_many :product_prices
  has_many :product_images
  has_many :category
  has_many :product_detail
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  def product_price
    price = product_prices.order("created_at DESC").first
    
    if price.nil?
      return ProductPrice.new
    else
      return price
    end    
  end

  def product_detail
    pro_detail = products.find(5).name
  end
  
  def self.get_hot_products
    self.includes(:product_info).where(product_infos: {product_hot: "on"})
  end
  
  def self.get_sale_products    
    self.includes(:product_info).where(product_infos: {product_sale: "on"})
  end
  
  def self.get_bestseller_products
    self.joins(:product_info).where(product_infos: {product_bestselled: "on"})
  end
  
  def self.get_prominent_products
    self.joins(:product_info).where(product_infos: {product_prominent: "on"})
  end
  
  def self.get_new_products
    self.joins(:product_info).where(product_infos: {product_new: "on"})
  end
  
  def self.get_favorite_products
    self.last(6)
  end
  
  def self.get_related_products
    self.first(12)
  end
  
  def self.search(params)
    self.first(15)
  end
 

  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end