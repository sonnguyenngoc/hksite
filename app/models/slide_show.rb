class SlideShow < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  
  def self.get_slideshows
    self.last(3)
  end
end
