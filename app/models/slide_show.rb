class SlideShow < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  
  def self.get_slideshows
    self.order("created_at desc").last(10)
  end
end
