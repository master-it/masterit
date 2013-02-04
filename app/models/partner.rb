class Partner < ActiveRecord::Base
  attr_accessible :image, :name, :image_cache
  mount_uploader :image, PartnerUploader

  def role?(role)
    self.role == role.to_s
  end
end

