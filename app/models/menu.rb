class Menu < ActiveRecord::Base
  mount_uploader :menu_image, MenuUploader
  mount_uploader :image_url, MenuUploader
  
  has_many :parent_menus, dependent: :destroy
  has_many :parent, through: :parent_menus, source: :parent
  has_many :child_menus, class_name: "ParentMenu", foreign_key: "parent_id", dependent: :destroy
  has_many :children, through: :child_menus, source: :menu
  belongs_to :category
  has_many :categories_menus
  has_and_belongs_to_many :categories
  
  def self.get_menus
    self.all.where(level: 1)
            .order("created_at ASC")
  end

  def update_level(lvl)
    self.level = lvl
    self.save
  end
  
  def get_products_for_categories(params)
    menu = Menu.find(params[:id])
    records = Product.get_all.joins(:categories)
                      .where(status: 1)
                      .where(categories: {id: menu.get_all_category_ids})
    
    if params[:sort_by] == 'name'
      records = records.joins(:categories).where(categories: {id: menu.get_all_category_ids}).order("products.stock DESC, products.name #{params[:sort_group]}")
    end
    
    if params[:sort_by] == 'created_at'
      records = records.joins(:categories).where(categories: {id: menu.get_all_category_ids}).order("products.stock DESC, products.created_at #{params[:sort_group]}")
    end
    
    return records
  end
  
  def get_all_category_ids
      arr = []
      self.categories.each do |i|
          arr += i.get_all_related_ids
      end
      
      return arr
  end
  
end
