class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :manufacturer
  has_many :product_prices, :dependent => :destroy
  has_many :product_images
end