class Work < ActiveRecord::Base
  attr_accessible :description, :image, :name, :nomination, :user_id
  belongs_to :user
end
