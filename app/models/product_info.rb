class ProductInfo < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  belongs_to :product
  has_and_belongs_to_many :categories
  belongs_to :manufacturer
  
end
