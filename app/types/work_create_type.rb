class WorkCreateType < Work
  include BasicType

  attr_accessible :sources_attributes, :videos_attributes, :images_attributes

  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :sources, :reject_if => :all_blank, :allow_destroy => true

end