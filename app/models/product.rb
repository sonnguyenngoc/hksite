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
      p = ProductPrice.new
    else
      p = price
    end
    # p.price = p.price.to_f*1.1
    
    return p
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
    records = self.includes(:product_info).where(status: 1)
                                          .where(product_infos: {product_sale: "on"}).order("product_infos.updated_at DESC")
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
    records = self.joins(:product_info).where(status: 1)
                                      .where(product_infos: {product_bestselled: "on"}).order("product_infos.updated_at DESC")
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
    records = self.joins(:product_info).where(status: 1)
                                      .where(product_infos: {product_prominent: "on"}).order("product_infos.updated_at DESC")
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
    records = self.all.order("stock DESC")
  end
  
  def self.get_new_products_manual(params)
    records = self.joins(:product_info).where(status: 1)
                                      .where(product_infos: {product_new: "on"}).order("product_infos.updated_at DESC")
    if params[:sort_by] == 'name'
      products = self.joins(:product_info).where(product_infos: {product_new: "on"})
      records = products.order("products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      products = self.joins(:product_info).where(product_infos: {product_new: "on"})
      records = products.order("products.created_at #{params[:sort_group]}")
    end
    
    # overide all
    #records = self.all.order("stock DESC")
    
    return records
  end
  
  def self.get_sort_manufacturer(params)
    records = self.where(manufacturer_id: params[:manufacturer_id])
  end
  
  def self.sort_by
    [
      ["Tên sản phẩm","products.name"],
      ["Giá sản phẩm","products.product_price.price"],
      ["Còn trong kho","products.stock"],
    ]
  end
  
  def self.sort_order
    [
      ["Tăng dần","asc"],
      ["Giảm dần","desc"],
    ]
  end
  
  def self.search(params)
    records = Product.where(status: 1)
    if params[:search].present?
      params[:search].split(" ").each do |k|
        records = records.where("LOWER(products.cache_search) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
      end
      #records = records.where("LOWER(products.cache_search) LIKE ?", "%#{params[:search].strip.downcase}%") if params[:search].present?    
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
    
    if params[:sort_by].present? and params[:sort_order]
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "products.name"
      sort_order = params[:sort_order].present? ? params[:sort_order] : "asc"
      records = records.order("#{sort_by} #{sort_order}")
    elsif !(params[:sort_by].present? and params[:sort_order])
      records = records.order("stock DESC")
    end
    
    return records
    
  end
  
  def self.admin_search(params)
    records = Product.all
    
    if params[:search_product_infos].present?
      records = records.where('LOWER(products.name) LIKE ?', "%#{params[:search_product_infos].strip.downcase}%")
    end
    
    if params[:type]=='product_new'
      records = Product.joins(:product_info)
      records = records.where(product_infos: {product_new: 'on'})
    end
    
    if params[:type]=='product_hot'
      records = Product.joins(:product_info)
      records = records.where(product_infos: {product_hot: 'on'})
    end
    
    if params[:type]=='product_prominent'
      records = Product.joins(:product_info)
      records = records.where(product_infos: {product_prominent: 'on'})
    end
    
    if params[:type]=='product_sale'
      records = Product.joins(:product_info)
      records = records.where(product_infos: {product_sale: 'on'})
    end
    
    if params[:type]=='product_bestselled'
      records = Product.joins(:product_info)
      records = records.where(product_infos: {product_bestselled: 'on'})
    end
    
    #if params[:manufacturers].present?
    #  records = records.where(manufacturer_id: params[:manufacturers])
    #end
    
    #if !params["order"].nil?
    #  @records = @records.order("created_at #{params["order"]}")
    #end

    return records
  end
  
  def self.get_by_manufacturer(params)
    records = self.search(params).where(manufacturer_id: params[:manufacturer_id])
    
    return records
  end
  
  #def self.sort_by_price(params)
  #  if params[:sort_group]=='ASC'
  #    records = records.order("products.product_price.price #{params[:sort_group]}")
  #  end
  #  
  #  if params[:sort_group]=='DESC'
  #    records = records.order("products.product_price.price #{params[:sort_group]}")
  #  end
  #end
 
  def get_amount_prices
    if !self.product_info.sale_off_price.nil?
      product_price.price.to_f*(1 - (self.product_info.sale_off_price/100))
    end
  end
 
 # def get_amount_sale_prices
 #   if !self.product_info.sale_off_price.present? and self.product_info.sale_price.present?
 #     product_price.price.to_f*(1 - (self.product_info.sale_off_price/100))
 #   elsif !self.product_info.sale_off_price.present? and !self.product_info.sale_price.present?
 #     self.product_info.sale_price.to_i
 #   end
 # end
  
 # def get_amount_sale_off_prices
 #   if !self.product_info.sale_price.nil? or self.product_info.sale_off_price.nil?
 #     ((product_price.price.to_f - product_info.sale_off_price.to_f)*100)/(product_price.price.to_f)
 #   elsif !self.product_info.sale_price.nil? and !self.product_info.sale_off_price.nil?
 #     self.product_info.sale_off_price.to_f
 #   end
 # end
  
  def display_price
    if !self.product_info.nil?
      if (self.product_info.product_sale == "on") && (self.product_info.sale_price > 0)
        self.product_info.sale_price.to_i
      else
        self.display_default_price
      end  
    else
        self.display_default_price
    end
    
  end
  
  def display_default_price
    self.product_price.price.to_i
  end
  
  def display_name
    result = ''
    if !categories.first.nil? and categories.first.name != 'none'
      result += categories.first.name + " "
    end
    
    #if !manufacturer.nil? and manufacturer.name != 'none'
    #  result += manufacturer.name + " "
    #end
    
    result += name
    result += " " + product_code if !product_code.nil?
    
    return result.strip
  end
  
  def get_discount_percent
    percent = 0
    price = self.product_price.price
    old_price = self.get_old_price
    if !old_price.nil?
      percent = ((old_price.price - price)/old_price.price)*100
    end
    return percent.round(1)
  end
  
  def get_old_price
    second_price = self.product_prices.order("created_at DESC").second
    if second_price.present? and second_price.price.present? and self.product_price.price.present? and second_price.price.to_f > self.product_price.price.to_f
      second_price
    else
      nil
    end
  end
  
  def get_related_products
    records = Product.all
    return records.limit(10)
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