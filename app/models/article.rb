class Article < ActiveRecord::Base
  mount_uploader :image_url, PictureUploader
  
  belongs_to :tag
end
