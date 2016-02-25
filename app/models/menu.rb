class Menu < ActiveRecord::Base
  has_many :parent_menus, dependent: :destroy
  has_many :parent, through: :parent_menus, source: :parent
  has_many :child_menus, class_name: "ParentMenu", foreign_key: "parent_id", dependent: :destroy
  has_many :children, through: :child_menus, source: :menu
  belongs_to :category
  has_many :categories_menus
  has_and_belongs_to_many :categories

  def update_level(lvl)
    self.level = lvl
    self.save
  end
  
  def get_products_for_categories(params)
    menu = Menu.find(params[:id])
    Product.joins(:categories).where(categories: {id: menu.get_all_category_ids})
  end
  
  def get_all_category_ids
      arr = []
      self.categories.each do |i|
          arr += i.get_all_related_ids
      end
      
      return arr
  end
  
end
