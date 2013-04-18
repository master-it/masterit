class Work < ActiveRecord::Base
  attr_accessible :description, :image, :name, :nomination, :user_id
  belongs_to :user
  has_many :sources, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  has_many :images, :dependent => :destroy
  
  belongs_to :tour
  
  accepts_nested_attributes_for :sources, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

end
