class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :manufacturer
  belongs_to :product_infos
  has_many :product_prices
  has_many :product_images
  has_many :category
  has_many :product_detail
  
  def product_price
    price = product_prices.order("created_at DESC").first
    
    if price.nil?
      return ProductPrice.new
    else
      return price
    end    
  end
  
  def category_1
    cate = Category.where(level: '1')
    return cate
  end
  
  def category_2
    cate = Category.where(level: '2')
  end
  
  def product_detail
    pro_detail = products.find(5).name
  end
  
end