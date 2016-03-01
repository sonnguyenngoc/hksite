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
  has_and_belongs_to_many :categories
  
  def product_price
    price = product_prices.order("created_at DESC").first
    
    if price.nil?
      return ProductPrice.new
    else
      return price
    end    
  end
  
  def product_image
    img = product_images.where.not(filename: nil).order("display_order").first
    return img.nil? ? ProductImage.new : img
  end

  def product_detail
    pro_detail = products.find(5).name
  end
  
  def self.get_hot_products(params)
    records = self.includes(:product_info).where(product_infos: {product_hot: "on"}).order("product_infos.updated_at DESC")
    if params[:sort_by] == 'name'
      products = self.joins(:product_info).where(product_infos: {product_hot: "on"})
      records = products.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      products = self.joins(:product_info).where(product_infos: {product_hot: "on"})
      records = products.order("products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
  
  def self.get_sale_products(params)    
    records = self.includes(:product_info).where(product_infos: {product_sale: "on"}).order("product_infos.updated_at DESC")
    if params[:sort_by] == 'name'
      products = self.joins(:product_info).where(product_infos: {product_sale: "on"})
      records = products.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      products = self.joins(:product_info).where(product_infos: {product_sale: "on"})
      records = products.order("products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
  
  def self.get_bestseller_products(params)
    records = self.joins(:product_info).where(product_infos: {product_bestselled: "on"}).order("product_infos.updated_at DESC")
    if params[:sort_by] == 'name'
      products = self.joins(:product_info).where(product_infos: {product_bestselled: "on"})
      records = products.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      products = self.joins(:product_info).where(product_infos: {product_bestselled: "on"})
      records = products.order("products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
  
  def self.get_prominent_products(params)
    records = self.joins(:product_info).where(product_infos: {product_prominent: "on"}).order("product_infos.updated_at DESC")
    if params[:sort_by] == 'name'
      products = self.joins(:product_info).where(product_infos: {product_prominent: "on"})
      records = products.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      products = self.joins(:product_info).where(product_infos: {product_prominent: "on"})
      records = products.order("products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
  
  def self.get_new_products(params)
    records = self.joins(:product_info).where(product_infos: {product_new: "on"}).order("product_infos.updated_at DESC")
    if params[:sort_by] == 'name'
      products = self.joins(:product_info).where(product_infos: {product_new: "on"})
      records = products.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      products = self.joins(:product_info).where(product_infos: {product_new: "on"})
      records = products.order("products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
  
  def self.get_sort_manufacturer(params)
    records = self.where(manufacturer_id: params[:manufacturer_id])
  end
  
  def self.search(params)
    records = Product.all
    if params[:search].present?
      records = records.where('LOWER(products.name) LIKE ?', "%#{params[:search].strip.downcase}%")
    end
    
    if params[:manufacturer_id].present?
      records = records.where('products.manufacturer_id = ?', "#{params[:manufacturer_id]}")
    end
    
    if params[:category_id].present?
      menu = Menu.find(params[:category_id])
      records = records.joins(:categories).where(categories: {id: menu.get_all_category_ids})
    end
    
    if params[:search_new_products].present?
      records = records.get_new_products.where('LOWER(products.name) LIKE ?', "%#{params[:search_new_products].strip.downcase}%")
    end
    
    if params[:search_hot_products].present?
      records = records.get_hot_products.where('LOWER(products.name) LIKE ?', "%#{params[:search_hot_products].strip.downcase}%")
    end
    
    if params[:search_prominent_products].present?
      records = records.get_prominent.products.where('LOWER(products.name) LIKE ?', "%#{params[:search_prominent_products].strip.downcase}%")
    end
    
    if params[:search_bestseller_products].present?
      records = records.get_bestseller_products.where('LOWER(products.name) LIKE ?', "%#{params[:search_bestseller_products].strip.downcase}%")
    end
    
    if params[:search_sale_products].present?
      records = records.get_sale_products.where('LOWER(products.name) LIKE ?', "%#{params[:search_sale_products].strip.downcase}%")
    end
  
    return records
  end
  
  def self.get_by_manufacturer(params)
    records = self.where(manufacturer_id: params[:manufacturer_id])
    
    if params[:sort_by] == 'name'
      records = records.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      records = records.order("products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
 
  def get_amount_prices
    if !self.product_info.sale_off_price.nil?
      product_price.price.to_f*(1 - (self.product_info.sale_off_price/100)) 
    end
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