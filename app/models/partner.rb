class Partner < ActiveRecord::Base
  mount_uploader :image_url, PartnerUploader
  
  belongs_to :manufacturer
end
