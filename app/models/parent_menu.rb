class ParentMenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :parent, class_name: "Menu"
end
