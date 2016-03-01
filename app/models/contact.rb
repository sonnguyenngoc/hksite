class Contact < ActiveRecord::Base
  has_many :parent_contacts, :dependent => :destroy
  has_many :parent, :through => :parent_contacts, :source => :parent
  has_many :child_contacts, :class_name => "ParentContact", :foreign_key => "parent_id", :dependent => :destroy
  has_many :children, :through => :child_contacts, :source => :contact
end