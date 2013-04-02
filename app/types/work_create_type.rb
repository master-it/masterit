class WorkCreateType < Work
  include BasicType

  attr_accessible :sources_attributes, :videos_attributes, :images_attributes
end