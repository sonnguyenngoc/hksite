class Partner < ActiveRecord::Base
  mount_uploader :image_url, PartnerUploader
  
  belongs_to :manufacturer
  
  def self.get_partners
    self.all.limit(28).order("created_at DESC")
  end
  
  def get_name
    manufacturer.name
  end
end
