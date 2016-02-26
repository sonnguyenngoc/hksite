class Article < ActiveRecord::Base
  mount_uploader :image_url, PictureUploader
  
  belongs_to :tag
  
  def self.get_all_articles
    self.joins(:tag).where("tags.title != 'Giới thiệu công ty'").order("created_at DESC")
  end
  
  def self.get_article(params)
      self.joins(:tag).where(tags: {id: params[:id]})
  end
end
