class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :menus
  
  has_many :parent_categories, :dependent => :destroy
  has_many :parent, :through => :parent_categories, :source => :parent
  has_many :child_categories, :class_name => "ParentCategory", :foreign_key => "parent_id", :dependent => :destroy
  has_many :children, :through => :child_categories, :source => :category
  
  def get_all_related_ids
      arr = []
      arr << self.id
      self.children.each do |i1|
          arr << i1.id
          i1.children.each do |i2|
              arr << i2.id
              i2.children.each do |i3|
                  arr << i3.id
              end
          end 
      end
      
      return arr
  end
  
end