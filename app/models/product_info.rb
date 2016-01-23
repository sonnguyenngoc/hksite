class ProductInfo < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  has_many :products
end
